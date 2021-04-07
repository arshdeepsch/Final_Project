
module Vending(Clock,Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_P,S_P,C_E,sseg,an);
input wire Clock,Resetn,S_A,C_A,C_1,C_0;
output wire S_D,C_D,C_P,S_P,C_E;
output wire [7:0]sseg;
output wire [3:0]an;

//sseg_display D1(Clock,S_D,C_D,C_P,S_P,C_E,sseg,an);
Vending_FSM F1(Clock, Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_P,S_P,C_E);
disp_hex_mux M1(Clock, 1'b0 , 4'b0000, 4'b0000 , hex1 , hex0 , dp_in ,an , sseg );

endmodule
