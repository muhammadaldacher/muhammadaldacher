// File: testbench.v
// This is a top level testbench for the
// project design, which is part of
// the EE178 Lab #8 assignment.

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

  reg clk;
  wire pclk_mirror;
  wire vs, hs;
  wire [3:0] r, g, b;
  wire [15:0] leds;
  reg [15:0] switches;
  wire an3, an2, an1, an0;
  wire ca, cb, cc, cd, ce, cf, cg, dp;
  reg btnc, btnu, btnd, btnl, btnr;

  // Instantiate the project module.

  project my_project (
    .clk(clk),
    .switches(switches),
    .leds(leds),
    .btnc(btnc),
    .btnu(btnu),
    .btnd(btnd),
    .btnl(btnl),
    .btnr(btnr),
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
    .dp(dp),
    .vs(vs),
    .hs(hs),
    .r(r),
    .g(g),
    .b(b),
    .pclk_mirror(pclk_mirror)
  );

  // Instantiate the tiff_writer module.

  tiff_writer my_writer (
    .pclk_mirror(pclk_mirror),
    .r({r,r}), // fabricate an 8-bit value
    .g({g,g}), // fabricate an 8-bit value
    .b({b,b}), // fabricate an 8-bit value
    .go(vs),
    .xdim(16'd1056),
    .ydim(16'd628)
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
    switches = 16'h0000;
    btnc = 1'b0;
    btnu = 1'b0;
    btnd = 1'b0;
    btnl = 1'b0;
    btnr = 1'b0;
    $display("If simulation ends before the testbench");
    $display("completes, use the menu option to run all.");
    $display("Prepare to wait a long time...");
    wait (vs == 1'b0);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    @(negedge vs) $display("Info: negedge VS at %t",$time);
    // End the simulation.
    $display("Simulation is over, check the waveforms.");
    $stop;
  end

endmodule
