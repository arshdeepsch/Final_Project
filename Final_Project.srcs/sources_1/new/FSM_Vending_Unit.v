`timescale 1ns / 1ps

module FSM_Vending_Unit (Clock, Resetn,S_A,C_A,C_1,C_0,S_D,C_D,
//C_P,S_P,
C_E,hex1,hex0);
input Clock, Resetn;
input S_A,C_A,C_1,C_0;
output S_D,C_D,C_E;
//output C_P,S_P;
output reg [3:0] hex1 , hex0;
reg [2:0] Y;
parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b111;

always @(negedge Resetn, posedge Clock)
if (Resetn == 0) Y <= A;
else
case (Y)

default: Y <= 3'b000;
endcase

assign S_D = (Y == D);
assign C_D = (Y == E | Y == F);
//assign C_P = (Y == B);
//assign S_P = (Y == C);
assign C_E = (Y == F | Y == G);
endmodule