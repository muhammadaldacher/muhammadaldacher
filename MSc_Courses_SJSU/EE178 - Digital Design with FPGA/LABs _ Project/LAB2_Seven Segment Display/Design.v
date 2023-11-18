// File: quad_seven_seg.v
// This is the top level design for EE178 Lab #2.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module quad_seven_seg (
    input wire clk,
    input wire [3:0] val3,
    input wire dot3,
    input wire [3:0] val2,
    input wire dot2,
    input wire [3:0] val1,
    input wire dot1,
    input wire [3:0] val0,
    input wire dot0,
    output reg an3,
    output reg an2,
    output reg an1,
    output reg an0,
    output reg ca,
    output reg cb,
    output reg cc,
    output reg cd,
    output reg ce,
    output reg cf,
    output reg cg,
    output reg dp
);

reg [1:0] step = 2'b00;
reg [3:0] val;
reg clk1 = 1'b0;
reg [7:0] counter = 0;

always@(posedge clk)
    begin
        counter <= counter +1;
        
        if(counter == 10) begin
              clk1 <= ~clk1;
              counter = 0;
            end
        end

always@(posedge clk1)
    begin
        step <= step + 1;
        end

always@*
    begin
        case(step)
        0:  {an3,an2,an1,an0} = 4'b1110;
        1:  {an3,an2,an1,an0} = 4'b1101;
        2:  {an3,an2,an1,an0} = 4'b1011;
        3:  {an3,an2,an1,an0} = 4'b0111;
        endcase
    end

always@*
    begin
        case(step)
        0: val = val0;
        1: val = val1;
        2: val = val2;
        3: val = val3;
        endcase
    end

always@*
    begin
        case(val)
        0: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111110);
        1: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b0110000);
        2: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1101101);
        3: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111001);
        4: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b0110011);
        5: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1011011);
        6: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1011111);
        7: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1110000);
        8: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111111);
        9: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111011);
        10: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1110111);
        11: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111111);
        12: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1001110);
        13: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1111110);
        14: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1001111);
        15: {ca,cb,cc,cd,ce,cf,cg} = ~(7'b1000111);
        endcase
     end

always@*
    begin
        if(step == 2'b00) dp = ~dot0;
        else if (step == 2'b01) dp = ~dot1;
        else if (step == 2'b10) dp = ~dot2;
        else dp = ~dot3;
    end

endmodule
