`timescale 1ns / 1ps



module RegisterFile_Test();

reg[2:0] RS, RT, RD;
reg RegWrite, Clock;
reg[15:0] WriteData;
wire[15:0] ReadRS, ReadRT;

initial
begin
#0 Clock=1'b0;
#5 RD=3'd8; WriteData = 16'd5; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0;RegWrite = 1'b1;
#5 RD=3'd9; WriteData = 16'd7; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite=1'b0;
#5 RS=3'd8; RT=3'd9;
#5 $stop;


end
RegisterFile RF(RS, RT, RD, WriteData, ReadRS, ReadRT, RegWrite, Clock);
endmodule