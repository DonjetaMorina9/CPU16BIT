`timescale 1ns / 1ps
module ALUControl(
input [1:0] ALUOp,
input [2:0] Funct,
input [2:0] opcode,
output reg [3:0] ALUCtrl
);


always @(ALUOp  )
begin

case(ALUOp)
2'b00:ALUCtrl = 4'b0100; //add (mbledhje)
2'b01:ALUCtrl = 4'b1100; //sub (zbritje)

 2'b10:
//ADD Adds two registers and stores the result in a register
    case(Funct)
    3'b000:ALUCtrl = 4'b0100; //add 
    3'b000:ALUCtrl = 4'b0011;//xor
    3'b000:ALUCtrl= 4'b0111;//div
    3'b000:ALUCtrl =4'b1100;//sub

    endcase


//ADDI is an I-type instruction. This instruction allows you to add the contents //of a register to an immediate value (a constant) and store the result in a  //register.
 2'b11: //I-format
       case(opcode)
     3'b011:ALUCtrl = 4'b0101;//addi
     3'b001:ALUCtrl = 4'b0000;//andi
     3'b010:ALUCtrl = 4'b0010;//ori
     3'b100:ALUCtrl= 4'b0001;//slti 
     endcase

endcase
end


endmodule
