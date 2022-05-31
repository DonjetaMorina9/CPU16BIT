`timescale 1ns / 1ps

module InstrMemory(

input wire[15:0] Hyrja, 
output reg[15:0] Dalja);
    

reg[7:0] instrMemory[127:0];

initial 
$readmemh("instrMem.mem", instrMemory);

  
assign Dalja = {instrMemory[Hyrja], instrMemory[Hyrja+1]}; 

endmodule
