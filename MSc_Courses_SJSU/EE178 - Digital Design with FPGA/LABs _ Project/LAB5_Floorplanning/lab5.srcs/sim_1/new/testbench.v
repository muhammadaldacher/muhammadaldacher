// File: testbench.v
// This is the top level testbench for EE178 Lab #5.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module testbench;
// Generate a free running 100 MHz clock
// signal to mimic what is on the board
// provided for prototyping.
reg clk;
always
begin
clk = 1'b0;
#5;
clk = 1'b1;
#5;
end
reg [15:0] in1, in2, in3, in4, in5;
always @(negedge clk)
begin
in1 <= $random;
in2 <= $random;
in3 <= $random;
in4 <= $random;
in5 <= $random;
end
initial
begin
$display("If simulation ends before the testbench");
$display("completes, use the menu option to run all.");
#400; // allow it to run
$display("Simulation is over, check the waveforms.");
$stop;
end
wire [15:0] out1, out2, out3, out4, out5;
sort my_sort (
.in1(in1),
.in2(in2),
.in3(in3),
.in4(in4),
.in5(in5),
.out1(out1),
.out2(out2),
.out3(out3),
.out4(out4),
.out5(out5),
.clk(clk)
);
endmodule