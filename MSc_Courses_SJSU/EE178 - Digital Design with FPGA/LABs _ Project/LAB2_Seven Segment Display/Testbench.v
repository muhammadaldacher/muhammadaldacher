// File: testbench.v
// This is a top level testbench for the
// quad_seven_seg design, which is part of
// the EE178 Lab #2 assignment.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
module testbench;
// Declare wires to be driven by the outputs
// of the design, and regs to drive the inputs.
// The testbench will be in control of inputs
// to the design, and will check the outputs.
// Then, instantiate the design to be tested.
wire an3, an2, an1, an0;
wire ca, cb, cc, cd, ce, cf, cg, dp;
reg [3:0] val3, val2, val1, val0;
reg dot3, dot2, dot1, dot0;
reg clk;
// Instantiate the quad_seven_seg module.
quad_seven_seg my_quad (
.clk(clk),
.val3(val3),
.dot3(dot3),
.val2(val2),
.dot2(dot2),
.val1(val1),
.dot1(dot1),
.val0(val0),
.dot0(dot0),
.an3(an3),
.an2(an2),
.an1(an1),
.an0(an0),
.ca(ca),
.cb(cb),
.cc(cc),
.cd(cd),
.ce(ce),
.cf(cf),
.cg(cg),
.dp(dp)
);
// Describe a process that generates a clock
// signal. The clock is 100 MHz.
always
begin
clk = 1'b0;
#5;
clk = 1'b1;
#5;
end
// Assign values to the input signals and
// check the output results. This template
// is meant to get you started, you can modify
// it as you see fit. If you simply run it as
// provided, you will need to visually inspect
// the output waveforms to see if they make
// sense...
initial
begin
$display("If simulation ends before the testbench");
$display("completes, use the menu option to run all.");
// This should get "0 1.2 3." on the display.
val3 <= 4'h0;
dot3 <= 1'b0;
val2 <= 4'h1;
dot2 <= 1'b1;
val1 <= 4'h2;
dot1 <= 1'b0;
val0 <= 4'h3;
dot0 <= 1'b1;
$display("Prepare to wait a long time...");
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
// End the simulation.
$display("Simulation is over, check the waveforms.");
$stop;
end
