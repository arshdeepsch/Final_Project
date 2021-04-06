`timescale 1ns / 1ps

module d_flipflop_tb();
reg clk,D;
wire Q, QB;


d_flipflop D1(clk,D,Q,QB);

initial begin
clk =0;
end

always begin clk =~ clk; #100; end

initial begin
D =1;
#200;
D = 0;
#100;
D=1;
end

endmodule
