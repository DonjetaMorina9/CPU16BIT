`timescale 1ns / 1ps


module DataMemory(
input wire[31:0] Address, 
input wire[31:0] WriteData, 
input wire MemWrite, 
input wire MemRead, 
input wire clock, 
output wire[31:0] ReadData
);


reg[15:0] DataMemory[127:0];
initial 
$readmemh("dataMem.mem", DataMemory);

always@(posedge clock)
begin
  if(MemWrite)
            begin
            dataMem[Address + 32'd0] <= WriteData[31:24];
            dataMem[Address + 32'd1] <= WriteData[23:16];
            dataMem[Address + 32'd2] <= WriteData[15:8];
            dataMem[Address + 32'd3] <= WriteData[7:0];
           end
    end
always@(negedge Clock)
begin
$writememb("dataMem.mem", DataMemory);
end

 assign ReadData[31:24] = dataMem[Address + 32'd0];
 assign ReadData[23:16] = dataMem[Address + 32'd1];
 assign ReadData[15:8] = dataMem[Address + 32'd2];
 assign ReadData[7:0] = dataMem[Address + 32'd3];


endmodule
