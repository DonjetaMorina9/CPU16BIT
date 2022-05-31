`timescale 1ns / 1ps



module CU(
input  [2:0] opcode, //HYRJA NGA D_OUT_1
 output reg RegDst,  //DALJET E CU, CU_OUT_x 
 output reg Branch,
 output reg MemRead, 
 output reg MemToReg, 
 output reg [1:0] ALUOp, 
 output reg MemWrite,
 output reg ALUSrc, 
 output reg RegWrite

);


always @(opcode)
begin
case(opcode)
3'b000:  //  XOR
    begin 
      RegDst = 1;
      ALUSrc = 0; 
      MemToReg = 0; 
      RegWrite = 1; 
      MemRead = 0; 
      MemWrite = 0; 
      ALUOp[1] = 1;
      ALUOp[0] = 0;
      Branch = 0; 
     end

3'b000: //PER ADD
    begin
    RegDst = 1;
    ALUSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 0;
    Branch = 0;
    end 
    
    
    3'b001: //PER ANDI
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 1;
    Branch = 0;
    end 
    
    3'b011: //PER ADDI pike shtese
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 1;
    Branch = 0;
    end
    
    3'b000: //PER SUB
    begin
    RegDst = 1;
    ALUSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 0;
    Branch = 0;
    end
    
    
    3'b100: //PER SLTI pike shtes
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 1;
    Branch = 0;
    end
    
    
    3'b000: //PER MOD pike shtese
    begin
    RegDst = 1;
    ALUSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 0;
    Branch = 0;
    end
    
    3'b101: //PER LW
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 1;
    RegWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    ALUOp[1] = 0;
    ALUOp[0] = 0;
    Branch = 0;
    end
    
    
    3'b110: //PER SW
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 1;
    ALUOp[1] = 0;
    ALUOp[0] = 0;
    Branch = 0;
    end
    
    3'b111: //PER BNE
    begin
    RegDst = 0;
    ALUSrc = 0;
    MemToReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 0;
    ALUOp[0] = 1;
    Branch = 0;
    end
    
    3'b010: //PER ORI
    begin
    RegDst = 0;
    ALUSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    ALUOp[1] = 1;
    ALUOp[0] = 1;
    Branch = 0;
    end
    
endcase

end

endmodule