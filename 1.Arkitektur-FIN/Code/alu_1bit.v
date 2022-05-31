`timescale 1ns / 1ps



module alu_1bit(
    input A,
    input B,
    input cin,
    input Ainvert,
    input Bnegate,
    input [2:0] Op,                
    output Result,
    output cout
    );
    
wire A, B, cin, Ainvert, Bnegate;
wire[2:0] Op;

wire Result;
wire cout;


wire net1, net2, net3, net4, net5, net6, net7, net8, net9, net10, Ajo, Bjo;

not a1 (Ajo, A);
not b1 (Bjo, B);

mux_2to1 m2_A(A, Ajo, Ainvert, net1);
mux_2to1 m2_B(B, Bjo, Bnegate, net2);

and n3 (net3, net1, net2);       
or n4 (net4, net1, net2);         
xor n5(net6, net1, net2);         
full_adder FullAdder (net1, net2, cin, net5, cout);   




mux_4to1 m4 (Op[0], Op[1], Op[2], net3, net4, net5, net6, Result);

endmodule
