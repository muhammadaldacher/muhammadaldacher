// File: oetsort.v
// This is the top level design for EE178 Lab #5b.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module sort (
input wire clk,
input wire [15:0] in1, in2, in3, in4, in5,
output wire [15:0] out1, out2, out3, out4, out5
);
wire [15:0] cnx0to1 [1:5];
wire [15:0] cnx1to2 [1:5];
wire [15:0] cnx2to3 [1:5];
wire [15:0] cnx3to4 [1:5];
wire [15:0] cnx4to5 [1:5];
// input stage
pass_thru #(.REGISTERED(1)) s0_1
(.clk(clk),.pin(in1),.pout(cnx0to1[1]));
pass_thru #(.REGISTERED(1)) s0_2
(.clk(clk),.pin(in2),.pout(cnx0to1[2]));
pass_thru #(.REGISTERED(1)) s0_3
(.clk(clk),.pin(in3),.pout(cnx0to1[3]));
pass_thru #(.REGISTERED(1)) s0_4
(.clk(clk),.pin(in4),.pout(cnx0to1[4]));
pass_thru #(.REGISTERED(1)) s0_5
(.clk(clk),.pin(in5),.pout(cnx0to1[5]));
// first stage
cmp_and_swp #(.REGISTERED(1)) s1_1n2
(.clk(clk),.xin(cnx0to1[1]),.yin(cnx0to1[2]),.xout(cnx1to2[1]),.yout(cnx1to2[2]));
cmp_and_swp #(.REGISTERED(1)) s1_3n4
(.clk(clk),.xin(cnx0to1[3]),.yin(cnx0to1[4]),.xout(cnx1to2[3]),.yout(cnx1to2[4]));
pass_thru #(.REGISTERED(1)) s1_5
(.clk(clk),.pin(cnx0to1[5]),.pout(cnx1to2[5]));
// second stage
pass_thru #(.REGISTERED(1)) s2_1
(.clk(clk),.pin(cnx1to2[1]),.pout(cnx2to3[1]));
cmp_and_swp #(.REGISTERED(1)) s2_2n3
(.clk(clk),.xin(cnx1to2[2]),.yin(cnx1to2[3]),.xout(cnx2to3[2]),.yout(cnx2to3[3]));
cmp_and_swp #(.REGISTERED(1)) s2_4n5
(.clk(clk),.xin(cnx1to2[4]),.yin(cnx1to2[5]),.xout(cnx2to3[4]),.yout(cnx2to3[5]));
// third stage
cmp_and_swp #(.REGISTERED(1)) s3_1n2
(.clk(clk),.xin(cnx2to3[1]),.yin(cnx2to3[2]),.xout(cnx3to4[1]),.yout(cnx3to4[2]));
cmp_and_swp #(.REGISTERED(1)) s3_3n4
(.clk(clk),.xin(cnx2to3[3]),.yin(cnx2to3[4]),.xout(cnx3to4[3]),.yout(cnx3to4[4]));
pass_thru #(.REGISTERED(1)) s3_5
(.clk(clk),.pin(cnx2to3[5]),.pout(cnx3to4[5]));
// fourth stage
pass_thru #(.REGISTERED(1)) s4_1
(.clk(clk),.pin(cnx3to4[1]),.pout(cnx4to5[1]));
cmp_and_swp #(.REGISTERED(1)) s4_2n3
(.clk(clk),.xin(cnx3to4[2]),.yin(cnx3to4[3]),.xout(cnx4to5[2]),.yout(cnx4to5[3]));
cmp_and_swp #(.REGISTERED(1)) s4_4n5
(.clk(clk),.xin(cnx3to4[4]),.yin(cnx3to4[5]),.xout(cnx4to5[4]),.yout(cnx4to5[5]));
// fifth stage
cmp_and_swp #(.REGISTERED(1)) s5_1n2
(.clk(clk),.xin(cnx4to5[1]),.yin(cnx4to5[2]),.xout(out1),.yout(out2));
cmp_and_swp #(.REGISTERED(1)) s5_3n4
(.clk(clk),.xin(cnx4to5[3]),.yin(cnx4to5[4]),.xout(out3),.yout(out4));
pass_thru #(.REGISTERED(1)) s5_5
(.clk(clk),.pin(cnx4to5[5]),.pout(out5));
endmodule
module pass_thru #(parameter REGISTERED = 0) (
input wire clk,
input wire [15:0] pin,
output reg [15:0] pout
);
generate
begin
if (REGISTERED)
begin
always @(posedge clk) pout <= pin;
end
else
begin
always @* pout = pin;
end
end
endgenerate
endmodule
module cmp_and_swp #(parameter REGISTERED = 0) (
input wire clk,
input wire [15:0] xin, yin,
output reg [15:0] xout, yout
);
generate
begin
if (REGISTERED)
begin
always @(posedge clk)
begin
if (xin < yin)
begin
xout <= yin;
yout <= xin;
end
else
begin
xout <= xin;
yout <= yin;
end
end
end
else
begin
always @*
begin
if (xin < yin)
begin
xout = yin;
yout = xin;
end
else
begin
xout = xin;
yout = yin;
end
end
end
end
endgenerate
endmodule