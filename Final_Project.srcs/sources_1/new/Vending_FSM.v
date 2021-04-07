`timescale 1ns / 1ps

module Vending_FSM (Clock, Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_P,S_P,C_E,hex1,hex0);
input Clock, Resetn;
input S_A,C_A,C_1,C_0;
output S_D,C_D,C_P,S_P,C_E;
output reg hex1 , hex0;
reg [2:0] Y;
parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;

always @(negedge Resetn, posedge Clock)
if (Resetn == 0) Y <= A;
else
case (Y)
A: if ({S_A,C_A,C_1,C_0} == 4'b0010 | {S_A,C_A,C_1,C_0} == 3'b00001) Y <= B;
   else Y <= A;
B: if ({S_A,C_A,C_1,C_0} == 4'b0011) Y <= C;
   else if({S_A,C_A,C_1,C_0} == 4'b1010 | {S_A,C_A,C_1,C_0} == 4'b1001) Y<=A;
   else if({S_A,C_A,C_1,C_0} == 4'b0110 | {S_A,C_A,C_1,C_0} == 4'b0101) Y<=E;
   else 
   begin
   Y <= B;
   hex1 <= 4'h2;
   hex0 <= 4'h5;
   end
C: if ({S_A,C_A,C_1,C_0} == 4'b1011) Y <= D;
   else if ({S_A,C_A,C_1,C_0} == 4'b0111) Y <= F;
   else begin
   Y <= C;   
   hex1 <= 4'h5;
   hex0 <= 4'h0;
   end
//D: if ({S_A,C_A,C_1,C_0} == 4'b1011) Y <= A;
//E: if({S_A,C_A,C_1,C_0} == 4'b0110 | {S_A,C_A,C_1,C_0} == 4'b0101) Y<=A;
//F: if ({S_A,C_A,C_1,C_0} == 4'b0111) Y <= A;
D: if ({S_A,C_A,C_1,C_0} == 4'b0000) Y <= A;
    else Y <= D;
E: if({S_A,C_A,C_1,C_0} == 4'b0000) Y<=A;
    else Y <= E;
F: if ({S_A,C_A,C_1,C_0} == 4'b0000) Y <= A;
    else Y <= F;
default: Y <= 3'bxxx;
endcase
assign S_D = (Y == D);
assign C_D = (Y == E || Y == F);
assign C_P = (Y == B);
assign S_P = (Y == C);
assign C_E = (Y == F);

endmodule