`timescale 1ns / 1ps



module CpntrolUnit_test(
input[1:0] ALUOp,
 input[3:0] Funct,
 output reg[2:0] Operacioni);

always @(ALUOp)
begin

case(ALUOp)
2'b00:                  //LW,SW ose ADDI
begin
assign Operacioni = 3'b010;
end
2'b01:
begin                   //BEQ
assign Operacioni = 3'b110;
end
2'b10:
begin
    case(Funct)
    4'b1111:                    //AND
    begin
    assign Operacioni = 3'b000;
    end
    4'b1110:                    //OR
    begin
    assign Operacioni = 3'b001;
    end
    4'b1101:                    //XOR
    begin
    assign Operacioni = 3'b011;
    end
    4'b0000:                    //ADD
    begin
    assign Operacioni = 3'b010;
    end
    4'b0001:                    //SUB
    begin
    assign Operacioni = 3'b110;
    end
    4'b1100:                    //ROR
    begin
    assign Operacioni = 3'b101;                 
    end
    4'b0010:                    //MUL           so me rendesi operacioni qe kryhet mrena ALUse me operacione themelore kur kem mul
    begin
    assign Operacioni = 3'b111;                  
    end
    endcase
end
2'b11:                                          //Per SLLI masi pom doket qe ska lidhje me mbledhje ose zbritje
begin
assign Operacioni = 3'b100;
end
endcase
end

endmodule 