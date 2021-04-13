
module FSM_Vending_Unit_tb( );
//Inputs
reg Clock, Resetn;
reg S_A,C_A,C_1,C_0;
//Outputs
wire S_D,C_D,C_E;
wire [3:0] hex3,hex2,hex1,hex0;
//Parameter
parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b111;
FSM_Vending_Unit uut(Clock, Resetn,S_A,C_A,C_1,C_0,S_D,C_D,
C_E,hex3,hex2,hex1,hex0);
initial 
begin
Clock=0;
S_A=0; C_A=0; C_0=0; C_1=0;
Resetn=0;
end
always #10 Clock=~Clock;
initial begin
//Candy Test 
#20; C_0=1;
#20; C_A=1;
#60; Resetn=1;
//Soda Test 
#20; C_A=0;
#20; Resetn=0;
#20; C_1=1;
#20; S_A=1;
#40;
$stop;
end
endmodule

