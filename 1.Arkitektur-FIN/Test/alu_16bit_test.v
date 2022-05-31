`timescale 1ns / 1ps

module testAlu16bit();
    reg [15:0] a;
    reg [15:0] b;
    reg [1:0] ALUOp;          //2 bit 
    reg BNegate;
    wire Zero;
    wire CarryOut;
    wire [15:0] Result;
    

initial
$monitor("a=%d, b=%d,ALUOp=%b, BNgate=%b, Zero=%b, CarryOut=%b, Result=%d", a, b, ALUOp, BNegate, Zero, CarryOut, Result);
initial
begin

//AND
#0 a=16'd5; b=16'd5;ALUOp=2'b00;BNegate=1'b0;
#10 a=16'd6; b=16'd3;ALUOp=2'b00;BNegate=1'b0;

//OR
#10 a=16'd5; b=16'd5;ALUOp=2'b01;BNegate=1'b0;
#10 a=16'd6; b=16'd3;ALUOp=2'b01;BNegate=1'b0;
//ADD
#0 a=16'd10; b=16'd20;ALUOp=2'b10;BNegate=1'b0;
#10 a=16'd10; b=16'd40;ALUOp=2'b10;BNegate=1'b0;
//SUB
#10 a=16'd10; b=16'd10;ALUOp=2'b10;BNegate=1'b1;
#10 a=16'd40; b=16'd30;ALUOp=2'b10;BNegate=1'b1;
//XOR
#10 a=16'd5; b=16'd5;ALUOp=2'b11;BNegate=1'b0;
#10 a=16'd6; b=16'd3;ALUOp=2'b11;BNegate=1'b0;
#10
$stop;
end
ALU_16bit ALU16bitTest(a, b, ALUOp,BNegate,Zero,CarryOut, Result);
endmodule