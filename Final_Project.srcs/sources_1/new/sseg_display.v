`timescale 1ns / 1ps

module sseg_display(Clock,S_D,C_D,C_P,S_P,C_E,sseg);
input Clock,S_D,C_D,C_P,S_P,C_E;
output reg[0:6] sseg;

always @(posedge Clock)
case ({S_D,C_D,C_P,S_P,C_E})	
//0: leds = 7'b0000001;
//1: leds = 7'b1001111;
5'b00100: sseg = 7'b1001111;
5'b00010: sseg = 7'b0010010;
//2: leds = 7'b0010010;
//3: leds = 7'b0000110;
//4: leds = 7'b1001100;
//5: leds = 7'b0100100;
//6: leds = 7'b0100000;
//7: leds = 7'b0001111;
//8: leds = 7'b0000000;
//9: leds = 7'b0000100;

default: sseg = 7'b0000000;
endcase



endmodule
