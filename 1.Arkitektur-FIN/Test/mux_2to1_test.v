`timescale 1ns / 1ps



module mux2ne1_test();
  reg[15:0] Hyrja0;
    reg[15:0] Hyrja1;
    reg S;
    wire[15:0] Dalja;
initial
$monitor("Hyrja0=%d, Hyrja1=%d, S=%, Dalja=%d", Hyrja0, Hyrja1, S, Dalja);
initial
begin
#0 Hyrja0=16'd5;
 Hyrja1=16'd20
;S=1'b0;
#10 Hyrja0=16'd5;
 Hyrja1=16'd20;
S=1'b1;
#10 $stop;
end
mux2ne1_16bit MuxTest(Hyrja0,Hyrja1,S,Dalja);
endmodule