`timescale 1ns / 1ps
module alu_1bit_test();

reg a, b, cin, BInvert;
reg [1:0] Operation;
wire Result, cout;

initial
$monitor("a=%b, B=%b, cin=%b, BInvert=%b, Operation=%b, Result=%b, cout=%b", a, b, cin, BInvert, Operation, Result, cout);


initial
begin
//AND
 #0 a=1'b0; b=1'b0; cin=1'b0; BInvert=1'b0; Operation=2'b00;
#10 a=1'b0; b=1'b1;  cin=1'b0;  BInvert=1'b0; Operation=2'b00;
#10 a=1'b1; b=1'b0;  cin=1'b0;  BInvert=1'b0; Operation=2'b00;
#10 a=1'b1; b=1'b1;  cin=1'b0; BInvert=1'b0; Operation=2'b00;


//OR
#10 a=1'b0; b=1'b0;  cin=1'b0; BInvert=1'b0; Operation=2'b01;
#10 a=1'b0; b=1'b1;  cin=1'b0;  BInvert=1'b0; Operation=2'b01;
#10 a=1'b1; b=1'b0;  cin=1'b0;  BInvert=1'b0; Operation=2'b01;
#10 a=1'b1; b=1'b1;  cin=1'b0; BInvert=1'b0; Operation=2'b01;
//ADD
#10 a=1'b0; b=1'b0;  cin=1'b0; BInvert=1'b0; Operation=2'b10;
#10 a=1'b0; b=1'b1;  cin=1'b0;  BInvert=1'b0; Operation=2'b10;
#10 a=1'b1; b=1'b0;  cin=1'b0;  BInvert=1'b0; Operation=2'b10;
#10 a=1'b1; b=1'b1;  cin=1'b0; BInvert=1'b0; Operation=2'b10;
#10 a=1'b1; b=1'b1;  cin=1'b1; BInvert=1'b0; Operation=2'b10;
//SUB
#10 a=1'b0; b=1'b0;  cin=1'b1; BInvert=1'b1; Operation=2'b10;
#10 a=1'b0; b=1'b1;  cin=1'b1;  BInvert=1'b1; Operation=2'b10;
#10 a=1'b1; b=1'b0;  cin=1'b1;  BInvert=1'b1; Operation=2'b10;
#10 a=1'b1; b=1'b1;  cin=1'b1; BInvert=1'b1; Operation=2'b10;
//XOR
#10 a=1'b0; b=1'b0;  cin=1'b0; BInvert=1'b0; Operation=2'b11;
#10 a=1'b0; b=1'b1;  cin=1'b0;  BInvert=1'b0; Operation=2'b11;
#10 a=1'b1; b=1'b0;  cin=1'b0;  BInvert=1'b0; Operation=2'b11;
#10 a=1'b1; b=1'b1;  cin=1'b0; BInvert=1'b0; Operation=2'b11;
#10  
$stop;
end

alu_1bit ALUTest(a, b,  cin, BInvert, Operation, Result, cout);

endmodule