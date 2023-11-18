// File: two_input_xor.v
// This is the top level design for EE178 Lab #1.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module two_input_xor (
input wire in1,
input wire in2,
output wire out
);
// You could substitute other possible descriptions.
assign out = in1 ^ in2;
endmodule
