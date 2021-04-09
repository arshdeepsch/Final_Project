
module Vending(Clock,Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_P,S_P,C_E,sseg,an);
input wire Clock,Resetn,S_A,C_A,C_1,C_0;
output wire S_D,C_D,C_P,S_P,C_E;
output wire [7:0]sseg;
output wire [3:0]an;
wire [3:0] hex1,hex0;
//sseg_display D1(Clock,S_D,C_D,C_P,S_P,C_E,sseg,an);

freq_divider D1(Clock, ClockOut);
Vending_FSM F1(ClockOut, Resetn, S_A, C_A, C_1, C_0, S_D, C_D, C_P, S_P, C_E, hex1, hex0);
disp_hex_mux M1(Clock, 1'b0 , 4'b0000, 4'b0000 , hex1 , hex0 , 4'b1011 ,an , sseg );

endmodule
