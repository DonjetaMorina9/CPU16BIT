`timescale 1ns / 1ps

//Hyrje ne CPU - CLock CPU_IN_1
module CPU(input clock);

//TELAT E BRENDSHEM TE CPU, SHIH CPU.PDF
    wire [5:0] opcode;
    wire RegDst, Jump, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
    wire [1:0] ALUOp;
    
  

//inicializimi i Datapath 
    DataPath CPU_DP
(clock, 
RegDst, 
Jump, 
Branch, 
MemRead, 
MemWrite, 
RegWrite, 
MemToReg, 
ALUSrc,
ALUOp,
opcode);

//incializimi i control unit
 CU ControlUnit ( 
opcode,
RegDst, 
Jump, 
Branch, 
MemRead, 
MemToReg,
ALUOp,
MemWrite,
ALUSrc,
RegWrite);

endmodule