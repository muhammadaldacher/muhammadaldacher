// File: testbench.v
// This is a top level testbench for EE178 Lab #1.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
module testbench;
// Declare a wire to be driven by the output
// of the two_input_xor design. Also declare
// two regs to drive the input of the design.
// These two regs may be assigned values by
// a behavioral stimulus.
wire sig3;
reg sig1, sig2;
// Instantiate the two_input_xor design module.
two_input_xor my_xor (.in1(sig1),.in2(sig2),.out(sig3));
// Assign values to the input signals and
// check the output results. This example
// is meant to illustrate the concept of a
// self-checking testbench, not to suggest
// that you should feel the need to verify
// the correct behavior of logical operators.
reg test_passed;
initial
begin
// Let's start off assuming we are going
// to pass the tests until we find a case
// that contradicts. Then wait 100 ns for
// the Xilinx global reset/tristate to be
// deasserted before doing anything.
test_passed = 1'b1;
#100;
// Test Case #0
sig1 = 1'b0;
sig2 = 1'b0;
#50;
$display("At time %t, sig1 = %b, sig2 = %b, output = %b.",
$time, sig1, sig2, sig3);
if (sig3 != 1'b0) test_passed = 1'b0;
// Test Case #1
sig1 = 1'b0;
sig2 = 1'b1;
#50;
$display("At time %t, sig1 = %b, sig2 = %b, output = %b.",
$time, sig1, sig2, sig3);
if (sig3 != 1'b1) test_passed = 1'b0;
// Test Case #2
sig1 = 1'b1;
sig2 = 1'b0;
#50;
$display("At time %t, sig1 = %b, sig2 = %b, output = %b.",
$time, sig1, sig2, sig3);
if (sig3 != 1'b1) test_passed = 1'b0;
// Test Case #3
sig1 = 1'b1;
sig2 = 1'b1;
#50;
$display("At time %t, sig1 = %b, sig2 = %b, output = %b.",
$time, sig1, sig2, sig3);
if (sig3 != 1'b0) test_passed = 1'b0;
// Now, print out a message with the test
// results and then finish the simulation.
if (test_passed) $display("Result: PASS");
else $display("Result: FAIL");
$stop;
end
endmodule