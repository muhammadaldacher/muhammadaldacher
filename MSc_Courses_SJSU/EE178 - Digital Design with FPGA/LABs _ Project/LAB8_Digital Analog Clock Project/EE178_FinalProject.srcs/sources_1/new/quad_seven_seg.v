// File: quad_seven_seg.v
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. 

module quad_seven_seg (
    input wire clk_in,
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
    output reg dp,
    output reg [3:0] seconds_units = 0,
    output reg [3:0] minutes_units = 0,
    output reg [3:0] hours_units = 0,
    output reg [3:0] seconds_tens = 0,
    output reg [3:0] minutes_tens = 0,
    output reg [3:0] hours_tens = 0,
    output wire sec_units_enable
);

reg [1:0] step = 2'b00;
reg [3:0] val;
reg [9:0] counter = 0;
wire enable;
wire clk;
  IBUF clk_ibuf (.I(clk_in),.O(clk));

wire min_units_enable;
wire hr_units_enable;
wire sec_tens_enable;
wire min_tens_enable;
wire hr_tens_enable;
wire endofday;

//===========================================
// Counter that gives 1Hz (period = 1 sec)
reg [27:0] timecounter = 0;
always@(posedge clk)
    begin
        if(sec_units_enable) timecounter <= 0;
        else timecounter <= timecounter+1;
    end
assign sec_units_enable = (timecounter == 99999999);

//===========================================
// Seconds (Units & Tens)
always@(posedge clk)
    begin
        if((sec_units_enable) && ({dot3,dot2,dot1,dot0} == 0)) 
            begin
              if(sec_tens_enable)  seconds_units <= 0;
              else seconds_units <= seconds_units +1;
            end
    end
assign sec_tens_enable = (seconds_units == 9) && sec_units_enable;

always@(posedge clk)
    begin
        if((sec_tens_enable) && ({dot3,dot2,dot1,dot0} == 0))
            begin
              if(min_units_enable)  seconds_tens <= 0;
              else seconds_tens <= seconds_tens +1;
            end
    end
assign min_units_enable = (seconds_tens == 5) && sec_tens_enable;

//===========================================
// Minutes (Units & Tens)
always@(posedge clk)
    begin
        if((min_units_enable) && ({dot3,dot2,dot1,dot0} == 0))
            begin
              if(min_tens_enable)  minutes_units <= 0;
              else minutes_units <= minutes_units +1;
            end
        else if(dot0 == 1)
            begin
                if (val0 <= 9) minutes_units <= val0;
                else minutes_units <= 9;
            end
    end
assign min_tens_enable = (minutes_units == 9) && min_units_enable;

always@(posedge clk)
    begin
        if((min_tens_enable) && ({dot3,dot2,dot1,dot0} == 0))
            begin
              if(hr_units_enable)  minutes_tens <= 0;
              else minutes_tens <= minutes_tens +1;
            end
        else if(dot1 == 1)
            begin
              if (val0 <= 5) minutes_tens <= val0;
              else minutes_tens <= 5;
            end
    end
assign hr_units_enable = (minutes_tens == 5) && min_tens_enable;

//===========================================
// Hours (Units & Tens)
always@(posedge clk)
    begin
        if((hr_units_enable) && ({dot3,dot2,dot1,dot0} == 0)) 
            begin
              if((hr_tens_enable)||(endofday))  hours_units <= 0;
              else hours_units <= hours_units +1;
            end
        else if(dot2 == 1)
            begin
              if ((val0 <= 9) && (hours_tens < 2)) hours_units <= val0;
              else hours_units <= 3;
            end
    end
assign hr_tens_enable = ((hours_units == 9) && hr_units_enable && (hours_tens <2)) || ((hours_units <= 3) && hr_units_enable && (hours_tens >=2));

always@(posedge clk)
    begin
        if((hr_tens_enable) && ({dot3,dot2,dot1,dot0} == 0)) 
            begin
              if(endofday)  hours_tens <= 0;
              else hours_tens <= hours_tens +1;
            end
        else if(dot3 == 1)
            begin
              if (val0 <= 2) hours_tens <= val0;
              else hours_tens <= 2;
            end
    end
assign endofday = (hours_tens >= 2) && (hours_units >= 3);

//===========================================
// Counter for the speed of the display
always@(posedge clk)
    begin
        counter <= counter +1;
        end

assign enable = (counter == 0);

always@(posedge clk)
    begin
        if (enable == 1)
            begin
                step <= step + 1;
            end
        end

//===========================================

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
        if (val3[3] == 1)
            begin
                case(step)
                    0: val = seconds_units;
                    1: val = seconds_tens;
                    2: val = minutes_units;
                    3: val = minutes_tens;
                endcase
            end
        else
            begin
                case(step)
                    0: val = minutes_units;
                    1: val = minutes_tens;
                    2: val = hours_units;
                    3: val = hours_tens;
                endcase 
            end
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
        endcase
     end

always@*
    begin
        if(step == 2'b00) dp = 1;
        else if (step == 2'b01) dp = 1;
        else if (step == 2'b10) dp = 0;
        else dp = 1;
    end
//===========================================
endmodule