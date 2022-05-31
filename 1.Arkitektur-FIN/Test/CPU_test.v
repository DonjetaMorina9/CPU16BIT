`timescale 1ns / 1ps


module CPU_test();
reg clock;
initial 
begin 
#0 clock = 1'b0;
#100 clock=1'b0;
end

always
begin
#5 clock=~clock; 
end

CPU cpu(clock);

endmodule
