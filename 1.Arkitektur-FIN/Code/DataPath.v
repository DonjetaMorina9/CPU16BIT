`timescale 1ns / 1ps



module DataPath(
input clock, 
input RegDst,
input Branch, 
input MemRead, 
input MemWrite,
input RegWrite,
input MemToReg,
input ALUSrc, 
input [1:0] ALUOp, 
input Instruction,
output [5:0] opcode
);

wire[2:0] opcode   ;
wire[2:0]  RS ;
wire[2:0]  RT ;
wire[2:0]   RD;
wire[2:0]   Funct;
wire[6:0]   immediate;
wire[15:0]   WD;
wire MemWrite, MemRead, clock;
wire [15:0]  RD1, RD2, alu2, imm_long, AdresaNeHyrje;
wire ainvert, bnegate , s0, s1, s2;
wire [2:0] op;

assign opcode  = Instruction [15:13];
assign RS  = Instruction [12:10];
assign RT  = Instruction [9:7];
assign RD  = Instruction [6:4];
assign Funct  = Instruction [3:0];
assign immediate  = Instruction [6:0];

mux_2to1 M21HyrjeRF ( s, RT, RD, z);
RegisterFile RF ( RS, RT, RD, WD, RFwe,RD1, RD2);


assign imm_long = {{7{immediate[5]}}, immediate[6:0]};
assign alu2 = s ? imm_long : RD2;

ALUControl ALUControl(s, Funct, op);

alu_16bit aluRF( RD1, alu2,bnegate,ainvert,bnegate, op, result,cout);
DataMemory DPDM(AdresaNeHyrje, WD, MemWrite, MemRead, clock, ReadData );


assign RFwe = 1;
assign WD = s  ?  (MemToReg==1 ? ReadData : 0): result;

endmodule 




