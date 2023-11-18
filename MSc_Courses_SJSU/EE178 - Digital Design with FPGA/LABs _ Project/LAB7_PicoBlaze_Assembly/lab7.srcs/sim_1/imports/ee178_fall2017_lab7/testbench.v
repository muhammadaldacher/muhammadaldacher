// File:  testbench.v
// This is the top level testbench for EE178 Lab #7.

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

  // Declare everything we want connected to the
  // top level tutorial design.  Generally, all
  // outputs from the tutorial must be connected
  // to wires, and we'll use regs for all inputs
  // to the tutorial, so that we can control them
  // procedurally in this testbench.

  reg [15:0] switches;
  wire [15:0] leds;

  tutorial tutorial_inst (
    .clk(clk),
    .switches(switches),
    .leds(leds)
  );

  // Task for waiting an arbitrary
  // number of clk clock cycles.

  task CYCLE_WAIT;
    input [31:0] cycles;
    integer cyc_cnt;
  begin
    cyc_cnt = cycles;
    while (cyc_cnt)
    begin
      cyc_cnt = cyc_cnt - 1;
      @(posedge clk);
    end
  end
  endtask

  // Include a mechanism to exercise
  // the design and finally stop the
  // simulation.

  initial
  begin
    $display("Simulation starting...");
    $display("If simulation ends before the testbench");
    $display("completes, use the menu option to run all.");
    switches = 16'h0000;
    CYCLE_WAIT(50);
    switches = 16'hcafe;
    CYCLE_WAIT(50);
    $display("Simulation finished.");
    $stop;
  end

endmodule
