`timescale 1ns / 1ps

module d_flipflop(clk,D,Q,QB);
input clk,D;
output reg Q, QB;

always @(posedge clk)
begin
Q <= D;
QB <= ~D;
end
endmodule

