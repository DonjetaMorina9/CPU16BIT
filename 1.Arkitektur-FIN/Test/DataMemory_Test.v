module DataMemory_Test ();

reg clock, MemWrite, MemRead;
reg[15:0] Address;
reg[15:0] WriteData;
wire[15:0] ReadData;

initial
begin
#0 clock =1'b0;
#5 MemWrite=1'b1; Address=16'd12; WriteData=16'h12; MenmRead=1'b0;
#5 clock=1'b1;
#5 clock=1'b0; MemWrite=1'b0;
#5 MemRead=1'b1; Address=16'd12;
#5 $stop;
end

DataMemory DM(Address, WriteData, MemWrite, MemRead, clock, ReadData);

endmodule