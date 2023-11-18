// File: tiff_writer.v
// This is a testbench sub-module for the
// tiff_writer, which is part of the EE178
// Lab #8 assignment.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module tiff_writer (
  input wire pclk_mirror,
  input wire [7:0] r,
  input wire [7:0] g,
  input wire [7:0] b,
  input wire go,
  input wire [15:0] xdim,
  input wire [15:0] ydim
  );

  integer file_ptr;
  integer file_open;
  integer frame_number = 0;

  task OPEN_FILE;
    input [7:0] number;
    reg [7:0] temp;
    reg [12*8:1] file_name;
    reg [7:0] ascii_hun;
    reg [7:0] ascii_ten;
    reg [7:0] ascii_one;
  begin
    temp = (number / 1 ) % 10;
    ascii_one = 8'h30 + temp;
    temp = (number / 10) % 10;
    ascii_ten = 8'h30 + temp;
    temp = (number / 100) % 10;
    ascii_hun = 8'h30 + temp;
    file_name = {"frame", ascii_hun, ascii_ten, ascii_one, ".tif"};
    file_ptr = $fopen(file_name, "wb"); 
    file_open = 1;
  end
  endtask

  task CLOSE_FILE;
  begin
    $fclose(file_ptr);
    file_open = 0;
  end
  endtask

  task WRITE_BYTE;
    input [7:0] data;
  begin
      $fwriteb(file_ptr, "%c", data);
  end
  endtask

  task WRITE_HEADER;
    input [15:0] whxdim;
    input [15:0] whydim;
    integer numbytes;
  begin

    // calculate some additional info, the
    // number of bytes in the image is going
    // to be the number of pixels times 3
    // for 24-bit pixel data.

    numbytes = whxdim * whydim * 3;

    // write the byte order in the header
    // this indicates big endian, which
    // means multi-byte fields are written
    // with the highest order bytes first
    // starting offset: 0x0000

    WRITE_BYTE(8'h4d);
    WRITE_BYTE(8'h4d);

    // write the tiff file identifier
    // starting offset: 0x0002

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h2a);

    // write a pointer to the first and only
    // image file directory at 0x00000010,
    // which must begin on a word boundary
    // starting offset: 0x0004

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h10);

    // write out zeroes for padding up to the
    // start of the image file directory
    // starting offset: 0x0008

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);

    // start of the image file directory
    // contains number of directory entries
    // which are only the 12 required entries
    // starting offset: 0x0010

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h0c);

    // entry one, image width
    // starting offset: 0x0012

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h00); // id
    WRITE_BYTE(8'h00); // type is 32-bit
    WRITE_BYTE(8'h04); // type is 32-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for number of x-pixels
    WRITE_BYTE(8'h00); // value for number of x-pixels
    WRITE_BYTE(xdim[15:8]); // value for number of x-pixels
    WRITE_BYTE(xdim[ 7:0]); // value for number of x-pixels

    // entry two, image length
    // starting offset: 0x001e

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h00); // type is 32-bit
    WRITE_BYTE(8'h04); // type is 32-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for number of y-pixels
    WRITE_BYTE(8'h00); // value for number of y-pixels
    WRITE_BYTE(ydim[15:8]); // value for number of y-pixels
    WRITE_BYTE(ydim[ 7:0]); // value for number of y-pixels

    // entry three, bits per sample
    // starting offset: 0x002a

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h02); // id
    WRITE_BYTE(8'h00); // type is 16-bit
    WRITE_BYTE(8'h03); // type is 16-bit
    WRITE_BYTE(8'h00); // three values exist
    WRITE_BYTE(8'h00); // three values exist
    WRITE_BYTE(8'h00); // three values exist
    WRITE_BYTE(8'h03); // three values exist
    WRITE_BYTE(8'h00); // pointer to bps triple
    WRITE_BYTE(8'h00); // pointer to bps triple
    WRITE_BYTE(8'h00); // pointer to bps triple
    WRITE_BYTE(8'hb8); // pointer to bps triple

    // entry four, compression
    // starting offset: 0x0036

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h03); // id
    WRITE_BYTE(8'h00); // type is 16-bit
    WRITE_BYTE(8'h03); // type is 16-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for non-compressed
    WRITE_BYTE(8'h01); // value for non-compressed
    WRITE_BYTE(8'h00); // zero padding
    WRITE_BYTE(8'h00); // zero padding

    // entry five, photometric interpretation
    // starting offset: 0x0042

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h06); // id
    WRITE_BYTE(8'h00); // type is 16-bit
    WRITE_BYTE(8'h03); // type is 16-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for rgb
    WRITE_BYTE(8'h02); // value for rgb
    WRITE_BYTE(8'h00); // zero padding
    WRITE_BYTE(8'h00); // zero padding

    // entry six, strip offsets
    // starting offset: 0x004e

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h11); // id
    WRITE_BYTE(8'h00); // type is 32-bit
    WRITE_BYTE(8'h04); // type is 32-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // pointer to image data
    WRITE_BYTE(8'h00); // pointer to image data
    WRITE_BYTE(8'h00); // pointer to image data
    WRITE_BYTE(8'hc0); // pointer to image data

    // entry seven, samples per pixel
    // starting offset: 0x005a

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h15); // id
    WRITE_BYTE(8'h00); // type is 16-bit
    WRITE_BYTE(8'h03); // type is 16-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for three samples
    WRITE_BYTE(8'h03); // value for three samples
    WRITE_BYTE(8'h00); // zero padding
    WRITE_BYTE(8'h00); // zero padding

    // entry eight, rows per strip
    // starting offset: 0x0066

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h16); // id
    WRITE_BYTE(8'h00); // type is 32-bit
    WRITE_BYTE(8'h04); // type is 32-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for rows per strip
    WRITE_BYTE(8'h00); // value for rows per strip
    WRITE_BYTE(ydim[15:8]); // value for rows per strip
    WRITE_BYTE(ydim[ 7:0]); // value for rows per strip

    // entry nine, strip byte counts
    // starting offset: 0x0072

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h17); // id
    WRITE_BYTE(8'h00); // type is 32-bit
    WRITE_BYTE(8'h04); // type is 32-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(numbytes[31:24]); // value for byte count
    WRITE_BYTE(numbytes[23:16]); // value for byte count
    WRITE_BYTE(numbytes[15: 8]); // value for byte count
    WRITE_BYTE(numbytes[ 7: 0]); // value for byte count

    // entry ten, x-resolution
    // starting offset: 0x007e

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h1a); // id
    WRITE_BYTE(8'h00); // type is rational
    WRITE_BYTE(8'h05); // type is rational
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // pointer to x-res rational
    WRITE_BYTE(8'h00); // pointer to x-res rational
    WRITE_BYTE(8'h00); // pointer to x-res rational
    WRITE_BYTE(8'ha8); // pointer to x-res rational

    // entry eleven, y-resolution
    // starting offset: 0x008a

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h1b); // id
    WRITE_BYTE(8'h00); // type is rational
    WRITE_BYTE(8'h05); // type is rational
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // pointer to y-res rational
    WRITE_BYTE(8'h00); // pointer to y-res rational
    WRITE_BYTE(8'h00); // pointer to y-res rational
    WRITE_BYTE(8'hb0); // pointer to y-res rational

    // entry twelve, resolution unit
    // starting offset: 0x0096

    WRITE_BYTE(8'h01); // id
    WRITE_BYTE(8'h28); // id
    WRITE_BYTE(8'h00); // type is 16-bit
    WRITE_BYTE(8'h03); // type is 16-bit
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h00); // one value exists
    WRITE_BYTE(8'h01); // one value exists
    WRITE_BYTE(8'h00); // value for inches
    WRITE_BYTE(8'h02); // value for inches
    WRITE_BYTE(8'h00); // zero padding
    WRITE_BYTE(8'h00); // zero padding

    // write a pointer to the next image file
    // directory, which is zero, since there
    // is no other image file directory...
    // starting offset: 0x00a2

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);

    // write out zeroes for padding to restore
    // alignment for 32-bit values coming up...
    // starting offset: 0x00a6

    WRITE_BYTE(8'h00);
    WRITE_BYTE(8'h00);

    // x-resolution data in rational format
    // entry ten of the first ifd points to
    // this value since it won't fit in ifd
    // starting offset: 0x00a8

    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h4b); // numerator 75 pixels
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h01); // denominator 1 resunit

    // y-resolution data in rational format
    // entry eleven of the first ifd points to
    // this value since it won't fit in ifd
    // starting offset: 0x00b0

    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h00); // numerator 75 pixels
    WRITE_BYTE(8'h4b); // numerator 75 pixels
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h00); // denominator 1 resunit
    WRITE_BYTE(8'h01); // denominator 1 resunit

    // bits per sample information stored as
    // a triple of 16-bit values (padded with
    // an extra value to restore alignment)
    // starting offset: 0x00b8

    WRITE_BYTE(8'h00); // eight bits per sample
    WRITE_BYTE(8'h08); // eight bits per sample
    WRITE_BYTE(8'h00); // eight bits per sample
    WRITE_BYTE(8'h08); // eight bits per sample
    WRITE_BYTE(8'h00); // eight bits per sample
    WRITE_BYTE(8'h08); // eight bits per sample
    WRITE_BYTE(8'h00); // eight bits per sample
    WRITE_BYTE(8'h08); // eight bits per sample

  end
  endtask

  reg go_delayed = 0;
  always @(go) go_delayed <= #1 go;

  always @(negedge pclk_mirror)
  begin
    if (file_open == 1)
    begin
      WRITE_BYTE(r); // eight bits per sample
      WRITE_BYTE(g); // eight bits per sample
      WRITE_BYTE(b); // eight bits per sample
    end
  end

  always @(posedge go_delayed)
  begin
    OPEN_FILE(frame_number);
    WRITE_HEADER(xdim, ydim);
    $display("Info: tiff_writer started frame %d",frame_number);
    @(posedge go) CLOSE_FILE;
    $display("Info: tiff writer finished frame %d",frame_number);
    frame_number = frame_number + 1;
  end

endmodule
