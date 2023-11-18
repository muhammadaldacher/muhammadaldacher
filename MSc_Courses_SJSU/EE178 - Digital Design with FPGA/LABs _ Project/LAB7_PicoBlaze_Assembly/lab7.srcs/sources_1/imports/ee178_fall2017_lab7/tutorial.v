// File: tutorial.v
// This is the top level design for EE178 Lab #7.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module tutorial (
  input wire clk,
  input wire [15:0] switches,
  output reg [15:0] leds
  );

  //******************************************************************//
  // Instantiate PicoBlaze and the Instruction ROM.                   //
  //******************************************************************//

  wire [11:0] address;
  wire [17:0] instruction;
  wire bram_enable;
  wire [7:0] port_id;
  wire [7:0] out_port;
  reg [7:0] in_port;
  wire write_strobe;
  wire k_write_strobe;
  wire read_strobe;
  wire interrupt_ack;

  kcpsm6 kcpsm6_inst (
    .address(address),
    .instruction(instruction),
    .bram_enable(bram_enable),
    .port_id(port_id),
    .write_strobe(write_strobe),
    .k_write_strobe(k_write_strobe),
    .out_port(out_port),
    .read_strobe(read_strobe),
    .in_port(in_port),
    .interrupt(1'b0),
    .interrupt_ack(interrupt_ack),
    .reset(1'b0),
    .sleep(1'b0),
    .clk(clk)
  ); 

  software software_inst (
    .address(address),
    .instruction(instruction),
    .bram_enable(bram_enable),
    .clk(clk)
  );

  //******************************************************************//
  // Implement output ports.                                          //
  //******************************************************************//

  always @(posedge clk)
    begin
    if (write_strobe)
    begin
      if (port_id == 8'h02) leds[7:0] <= out_port;
      if (port_id == 8'h03) leds[15:8] <= out_port;
    end
  end

  //******************************************************************//
  // Implement input ports.                                           //
  //******************************************************************//

  always @*
  begin
    case (port_id)
      8'h00: in_port = switches[7:0];
      8'h01: in_port = switches[15:8];
      default: in_port = 8'h00;
    endcase
  end

  //******************************************************************//
  //                                                                  //
  //******************************************************************//

endmodule