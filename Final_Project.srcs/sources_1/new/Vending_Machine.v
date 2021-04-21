
module Vending_Machine(Clock,Resetn,S_A,C_A,C_1,C_0,S_D,C_D,C_E,sseg,an);
input wire Clock,Resetn,S_A,C_A,C_1,C_0;
output wire S_D,C_D,C_E;
output wire [7:0]sseg;
output wire [7:0]an;
wire [3:0] hex7,hex6,hex5,hex4,hex3,hex2,hex1,hex0;

Cntr_Unit C1(Clock, ClockOut);
FSM_Vending_Unit F1(ClockOut, Resetn, S_A, C_A, C_1, C_0, S_D, C_D, C_E, hex7 , hex6 , hex5 , hex4,hex3,hex2,hex1, hex0);

Disp_Unit M1(Clock, 1'b0 , hex7 , hex6 , hex5 , hex4, hex3, hex2 , hex1 , hex0 , 4'b1011 ,an , sseg );

endmodule
