`timescale 1ns / 1ps

module freq_divider_tb();
reg clock_in; 
wire clock_out;

freq_divider D1(clock_in,clock_out);

initial begin 
clock_in = 0;
forever  #10 clock_in = ~clock_in;
end

endmodule
