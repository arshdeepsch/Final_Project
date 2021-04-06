`timescale 1ns / 1ps

module Vending_FSM (Clock, Resetn, z, S_A,C_A,C_1,C_0);
input Clock, Resetn;
input S_A,C_A,C_1,C_0;
output reg z;
reg [2:0] y, Y;
parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;

always @(negedge Resetn, posedge Clock)
if (Resetn == 0) y <= A;
else
case (y)
A: if ({S_A,C_A,C_1,C_0} == 4'b0010 | {S_A,C_A,C_1,C_0} == 3'b00001) Y <= B;
   else Y <= A;
B: if ({S_A,C_A,C_1,C_0} == 4'b0011) Y <= C;
    else Y <= B;
C: if ({S_A,C_A,C_1,C_0} == 4'b1011) Y <= D;
    else Y <= C;
D: if ({S_A,C_A,C_1,C_0}) Y <= C;
    else Y <= A;
E: if ({S_A,C_A,C_1,C_0}) Y <= C;
    else Y <= A;
default: Y <= 2'bxx;
endcase

endmodule