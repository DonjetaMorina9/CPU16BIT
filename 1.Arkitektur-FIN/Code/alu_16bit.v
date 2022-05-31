`timescale 1ns / 1ps


module alu_16bit(
input wire[15:0] a,
    input wire[15:0] b,
    input AInvert,
    input BNegate,
    input wire CarryIn,
    input [1:0] Op,
    output wire[15:0] result,
    output CarryOut,
    output Overflow,
	output Zero
    );
    

wire[14:0] c;


alu_1bit alu0(a[0], b[0], cin, AInvert, BNegate,result[15] , Op, result[0], c[0]);
alu_1bit alu1(a[1], b[1], c[0], AInvert, BNegate, 0, Op, result[1], c[1]);
alu_1bit alu2(a[2], b[2], c[1], AInvert, BNegate, 0, Op, result[2], c[2]);
alu_1bit alu3(a[3], b[3], c[2], AInvert, BNegate, 0, Op, result[3], c[3]); 
alu_1bit alu4(a[4], b[4], c[3], AInvert, BNegate, 0, Op, result[4], c[4]);
alu_1bit alu5(a[5], b[5], c[4], AInvert, BNegate, 0, Op, result[5], c[5]);
alu_1bit alu6(a[6], b[6], c[5], AInvert, BNegate,  0, Op, result[6], c[6]);
alu_1bit alu7(a[7], b[7], c[6], AInvert, BNegate,  0, Op, result[7], c[7]);
alu_1bit alu8(a[8], b[8], c[7], AInvert, BNegate,  0, Op, result[8], c[8]);
alu_1bit alu9(a[9], b[9], c[8], AInvert, BNegate,  0, Op, result[9], c[9]);
alu_1bit alu10(a[10], b[10], c[9], AInvert, BNegate , 0, Op, result[10], c[10]);
alu_1bit alu11(a[11], b[11], c[10], AInvert, BNegate , 0, Op, result[11], c[11]);
alu_1bit alu12(a[12], b[12], c[11], AInvert, BNegate , 0, Op, result[12], c[12]);
alu_1bit alu13(a[13], b[13], c[12], AInvert, BNegate , 0, Op, result[13], c[13]);
alu_1bit alu14(a[14], b[14], c[13], AInvert, BNegate , 0, Op, result[14], c[14]);
alu_1bit alu15(a[15], b[15], c[14], AInvert, BNegate , 0, Op, result[15], CarryOut);



assign zero=(result[0]|result[1]|result[2]|result[3]|result[4]|result[5]|result[6]|result[7]|result[8]|result[9]|result[10]|result[11]|result[12]|result[13]|result[14]|result[15]);
assign Overflow = c[14] ^ CarryOut;

endmodule