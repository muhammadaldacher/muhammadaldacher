// File: vga_example.v
// This is the top level design for EE178 Lab #4.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_example (
  input wire clk,
  output reg vs,
  output reg hs,
  output reg [3:0] r,
  output reg [3:0] g,
  output reg [3:0] b,
  output wire pclk_mirror
  );

  // Converts 100 MHz clk into 40 MHz pclk.
  // This uses a vendor specific primitive
  // called MMCME2, for frequency synthesis.

  wire clk_in;
  wire locked;
  wire clk_fb;
  wire clk_ss;
  wire clk_out;
  wire pclk;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg [7:0] safe_start = 0;

  IBUF clk_ibuf (.I(clk),.O(clk_in));

  MMCME2_BASE #(
    .CLKIN1_PERIOD(10.000),
    .CLKFBOUT_MULT_F(10.000),
    .CLKOUT0_DIVIDE_F(25.000))
  clk_in_mmcme2 (
    .CLKIN1(clk_in),
    .CLKOUT0(clk_out),
    .CLKOUT0B(),
    .CLKOUT1(),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .CLKFBOUT(clkfb),
    .CLKFBOUTB(),
    .CLKFBIN(clkfb),
    .LOCKED(locked),
    .PWRDWN(1'b0),
    .RST(1'b0)
  );

  BUFH clk_out_bufh (.I(clk_out),.O(clk_ss));
  always @(posedge clk_ss) safe_start<= {safe_start[6:0],locked};

  BUFGCE clk_out_bufgce (.I(clk_out),.CE(safe_start[7]),.O(pclk));

  // Mirrors pclk on a pin for use by the testbench;
  // not functionally required for this design to work.

  ODDR pclk_oddr (
    .Q(pclk_mirror),
    .C(pclk),
    .CE(1'b1),
    .D1(1'b1),
    .D2(1'b0),
    .R(1'b0),
    .S(1'b0)
  );

  // Instantiate the vga_timing module, which is
  // the module you are designing for this lab.

  wire [10:0] vcount, hcount;
  wire vsync, hsync;
  wire vblnk, hblnk;

  vga_timing my_timing (
    .vcount(vcount),
    .vsync(vsync),
    .vblnk(vblnk),
    .hcount(hcount),
    .hsync(hsync),
    .hblnk(hblnk),
    .pclk(pclk)
  );

  // This is a simple test pattern generator.

  always @(posedge pclk)
  begin
    // Just pass these through.
    hs <= hsync;
    vs <= vsync;
    // During blanking, make it it black.
    if (vblnk || hblnk) {r,g,b} <= 12'h0_0_0; 
    else
    begin
      // Active display, top edge, make a yellow line.
      if (vcount == 0) {r,g,b} <= 12'hf_f_0;
      // Active display, bottom edge, make a red line.
      else if (vcount == 599) {r,g,b} <= 12'hf_0_0;
      // Active display, left edge, make a green line.
      else if (hcount == 0) {r,g,b} <= 12'h0_f_0;
      // Active display, right edge, make a blue line.
      else if (hcount == 799) {r,g,b} <= 12'h0_0_f;
      // Active display, interior, fill with gray.
      // You will replace this with your own test.
      else 
        begin
            
            // Vertical Lines
            if (((hcount == 20) || (hcount == 60)) && (vcount >= 20) && (vcount < 60)) {r,g,b} <= 12'hf_0_a;
            else if (((hcount == 80) || (hcount == 120)) && ((vcount >= 40) && (vcount < 60))) {r,g,b} <= 12'h0_a_f;
            
            // Horizontal Lines
            else if (((hcount > 80) && (hcount < 120)) && ((vcount == 40))) {r,g,b} <= 12'h0_a_f;
            
            // Diagonal Lines
            else if (((hcount > 20) && (hcount < 60)) && ((vcount > 20) && (vcount <= 40))) 
                begin
                    if (hcount == vcount)   {r,g,b} <= 12'hf_0_a;
                    else if (hcount == (80 - vcount))
                        begin
                            {r,g,b} <= 12'hf_0_a;
                        end
                    else    {r,g,b} <= 12'ha_a_a;   
                end
            
            else if (((hcount > 80) && (hcount < 120)) && ((vcount > 20) && (vcount < 40))) 
                 begin
                     if (hcount == 120 - vcount)   {r,g,b} <= 12'h0_a_f;
                     else if (hcount == 80 + vcount)
                         begin
                             {r,g,b} <= 12'h0_a_f;
                         end
                     else    {r,g,b} <= 12'ha_a_a;   
                end
            // Rest of the screen
            else {r,g,b} <= 12'ha_a_a; //{r,g,b} <= 12'h8_8_8;   
        end   
    end
  end

endmodule
