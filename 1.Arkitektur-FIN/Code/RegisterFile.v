`timescale 1ns / 1ps


module RegisterFile(
input[2:0] RS,
input[2:0] RT,
input[2:0] RD,
input[15:0] WriteData,
input RegWrite,
input clock,
output[15:0] ReadRS,
output[15:0] ReadRT
);

reg[15:0] Registers[15:0];

//Reseto te gjithe regjistrat ne 0
integer i;
initial 
begin
for ( i =0; i <16; i=i+1)
Registers[i] <= 16'd0;
end


//Shkruaj ne regjiter
always @ (posedge clock)
begin
Registers[RD] <= WriteData;
end

//lexo regjistrat ReadData1, ReadData2
assign ReadRS = Registers[RS];
assign ReadRT = Registers[RT];

endmodule
