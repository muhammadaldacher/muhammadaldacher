// File: bubblesort.v
// This is the top level design for EE178 Lab #5a.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module sort (
input wire clk,
input wire [15:0] in1, in2, in3, in4, in5,
output reg [15:0] out1, out2, out3, out4, out5
);
reg [15:0] dat1, dat2, dat3, dat4, dat5;
always @(posedge clk)
begin
dat1 <= in1;
dat2 <= in2;
dat3 <= in3;
dat4 <= in4;
dat5 <= in5;
end
integer i, j;
reg [15:0] temp;
reg [15:0] array [1:5];
always @*
begin
array[1] = dat1;
array[2] = dat2;
array[3] = dat3;
array[4] = dat4;
array[5] = dat5;
for (i = 5; i > 0; i = i - 1)
begin
for (j = 1 ; j < i; j = j + 1)
begin
if (array[j] < array[j + 1])
begin
temp = array[j];
array[j] = array[j + 1];
array[j + 1] = temp;
end
end
end
end
always @(posedge clk)
begin
out1 <= array[1];
out2 <= array[2];
out3 <= array[3];
out4 <= array[4];
out5 <= array[5];
end
endmodule
