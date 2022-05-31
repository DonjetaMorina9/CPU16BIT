`timescale 1ns / 1ps



module full_adder(
input a, 
input b,
input  cin,
output sum,     
output cout);




assign shuma = a ^ b ^ cin;
assign cout = cin & a | cin & b | a & b;
//carry out = cout
endmodule
