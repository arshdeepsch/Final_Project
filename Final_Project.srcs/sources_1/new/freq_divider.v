`timescale 1ns / 1ps

module freq_divider(input wire clk ,output out);

// signal declaration
reg [31:0] r_reg;
wire [31:0] r_next;
// Register
always @ (posedge clk)
r_reg <= r_next;
//next state logic
assign r_next = (r_reg == 10) ? 0 : r_reg +1; //output logic
assign out = ( r_reg == 10) ? 1'b1 : 1'b0;

endmodule
