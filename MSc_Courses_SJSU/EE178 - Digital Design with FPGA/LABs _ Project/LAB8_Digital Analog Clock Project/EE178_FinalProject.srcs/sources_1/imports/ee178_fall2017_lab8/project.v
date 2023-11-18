// File: project.v
// This is the top level design for EE178 Lab #8.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module project (
  input  wire clk,
  input  wire [15:0] switches,
  output reg [15:0] leds,
  input wire btnc,
  input wire btnu,
  input wire btnd,
  input wire btnl,
  input wire btnr,
  output wire an3,
  output wire an2,
  output wire an1,
  output wire an0,
  output wire ca,
  output wire cb,
  output wire cc,
  output wire cd,
  output wire ce,
  output wire cf,
  output wire cg,
  output wire dp,
  output wire vs,
  output wire hs,
  output wire [3:0] r,
  output wire [3:0] g,
  output wire [3:0] b,
  output wire pclk_mirror
  );

  //******************************************************************//
  // To build a synchronous system, we need to use the vga pclk as    //
  // the clock for the entire project.  The external clk enters, we   //
  // send it into the vga_example, which has been edited to send      //
  // back not only the pclk_mirror but now also the pclk signal.      //
  // Instantiate vga_example and declare signals to connect it.       //
  //******************************************************************//
  wire          pclk;
  wire    [7:0] vga_write_data;
  wire    [7:0] vga_read_data;
  wire    [2:0] vga_address;
  wire          vga_write;
  wire          vga_irq;

  vga_example vga_example_inst (
    .clk(clk),
    .vs(vs),
    .hs(hs),
    .r(r),
    .g(g),
    .b(b),
    .pclk_mirror(pclk_mirror),
    .write_data(vga_write_data),
    .read_data(vga_read_data),
    .address(vga_address),
    .write(vga_write),
    .irq(vga_irq),
    .pclk(pclk)
  );

  //******************************************************************//
  // Instantiate quad_seven_seg and declare signals to connect it.    //
  //******************************************************************//

  reg    [19:0] qssd;
  wire [3:0] sec_units;
  wire [3:0] min_units;
  wire [3:0] hr_units;
  wire [3:0] sec_tens;
  wire [3:0] min_tens;
  wire [3:0] hr_tens;
  wire sec_enable;
      
  quad_seven_seg quad_seven_seg_inst (
    .clk_in(clk), //pclk
    .dot3(btnl), //qssd[19]
    .dot2(btnd), //qssd[18]
    .dot1(btnr), //qssd[17]
    .dot0(btnu), //qssd[16]
    .val3(switches[15:12]), //qssd[15:12]
    .val2(qssd[11:8]),
    .val1(qssd[7:4]),
    .val0(switches[3:0]), //qssd[3:0]
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
    .seconds_units(sec_units),
    .minutes_units(min_units),
    .hours_units(hr_units),
    .seconds_tens(sec_tens),
    .minutes_tens(min_tens),
    .hours_tens(hr_tens),
    .sec_units_enable(sec_enable)
    );

  //******************************************************************//
  // Instantiate PicoBlaze and the Instruction ROM.                   //
  //******************************************************************//

  wire   [11:0] address;
  wire   [17:0] instruction;
  wire          bram_enable;
  wire    [7:0] port_id;
  wire    [7:0] out_port;
  reg     [7:0] in_port;
  wire          write_strobe;
  wire          k_write_strobe;
  wire          read_strobe;
  wire          interrupt_ack;
  reg           interrupt = 0;

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
    .interrupt(interrupt),
    .interrupt_ack(interrupt_ack),
    .reset(1'b0),
    .sleep(1'b0),
    .clk(pclk)); 

  software software_inst (
    .address(address),
    .instruction(instruction),
    .bram_enable(bram_enable),
    .clk(pclk));

  always @(posedge pclk)
  begin
    if (interrupt_ack) interrupt <= 1'b0;
    else if (vga_irq) interrupt <= 1'b1;
  end

  //******************************************************************//
  // Implement output ports.                                          //
  // 8'h00: STAX                                                      //
  // 8'h01: STAY                                                      //
  // 8'h02: ENDX                                                      //
  // 8'h03: ENDY                                                      //
  // 8'h04: BUSY                                                      //
  // 8'h05: BEAM                                                      //
  // 8'h06: MODE                                                      //
  // 8'h07: PRNG                                                      //
  // 8'h08: LEDS_LO                                                   //
  // 8'h09: LEDS_HI                                                   //
  // 8'h0a: QSSD_LO                                                   //
  // 8'h0b: QSSD_HI                                                   //
  // 8'h0c: QSSD_DP                                                   //
  // 8'h0d: RESERVED                                                  //
  // 8'h0e: RESERVED                                                  //
  // 8'h0f: RESERVED                                                  //
  //******************************************************************//

  assign vga_write_data = out_port;
  assign vga_address = port_id[2:0];
  assign vga_write = write_strobe && (port_id[7:3] == 5'b00000);

  always @(posedge pclk)
    begin
    if (write_strobe)
    begin
      if (port_id == 8'h08) leds[7:0] <= out_port;
      if (port_id == 8'h09) leds[15:8] <= out_port;
      if (port_id == 8'h0a) qssd[7:0] <= out_port;
      if (port_id == 8'h0b) qssd[15:8] <= out_port;
      if (port_id == 8'h0c) qssd[19:16] <= out_port[3:0];
    end
  end
  
  //******************************************************************//
  // Implement input ports.                                           //
  // 8'h00: STAX                                                      //
  // 8'h01: STAY                                                      //
  // 8'h02: ENDX                                                      //
  // 8'h03: ENDY                                                      //
  // 8'h04: BUSY                                                      //
  // 8'h05: BEAM                                                      //
  // 8'h06: MODE                                                      //
  // 8'h07: PRNG                                                      //
  // 8'h08: RESERVED                                                  //
  // 8'h09: RESERVED                                                  //
  // 8'h0a: RESERVED                                                  //
  // 8'h0b: RESERVED                                                  //
  // 8'h0c: RESERVED                                                  //
  // 8'h0d: SWITCHES_LO                                               //
  // 8'h0e: SWITCHES_HI                                               //
  // 8'h0f: BUTTONS                                                   //
  // 8'h10: Seconds                                                   //
  // 8'h11: Minutes                                                   //
  // 8'h12: Hours                                                     //
  //******************************************************************//

  always @*
  begin
    case (port_id)
      8'h00: in_port = vga_read_data;
      8'h01: in_port = vga_read_data;
      8'h02: in_port = vga_read_data;
      8'h03: in_port = vga_read_data;
      8'h04: in_port = vga_read_data;
      8'h05: in_port = vga_read_data;
      8'h06: in_port = vga_read_data;
      8'h07: in_port = vga_read_data;
      8'h0d: in_port = switches[7:0];
      8'h0e: in_port = switches[15:8];
      8'h0f: in_port = {3'b000, btnc, btnu, btnd, btnl, btnr};
      8'h10: in_port = {sec_tens,sec_units};
      8'h11: in_port = {min_tens,min_units};
      8'h12: in_port = {hr_tens,hr_units};
      default: in_port = 8'h00;
    endcase
  end

  //******************************************************************//
  //                                                                  //
  //******************************************************************//

endmodule
