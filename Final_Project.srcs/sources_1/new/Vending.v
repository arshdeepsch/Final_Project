//`timescale 1ns / 1ps

module Vending(Clock,Resetn,S_A,C_A,C_1,C_0);
//S_D,C_D,C_P,S_P,C_E,sseg;
input Clock,Resetn,S_A,C_A,C_1,C_0;
wire S_D,C_D,C_P,S_P,C_E,sseg;

sseg_display D1(Clock,S_D,C_D,C_P,S_P,C_E,sseg);
Vending_FSM F1(Clock, Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_P,S_P,C_E);

endmodule
