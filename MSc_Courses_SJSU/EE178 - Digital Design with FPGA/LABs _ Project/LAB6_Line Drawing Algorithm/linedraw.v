// File: linedraw.v
// This is the linedraw design for EE178 Lab #6.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module linedraw (
  input wire go,
  output wire busy,
  input wire [7:0] stax,
  input wire [7:0] stay,
  input wire [7:0] endx,
  input wire [7:0] endy,
  output wire wr,
  output wire [15:0] addr,
  input wire pclk
  );
//--------------------------------------------------------------  
    wire signed [15:0] x0, y0, x1, y1;
    wire signed [15:0] dx, dy;
    wire Right, Down;
    
    wire signed [15:0] err_next,ew2,ew1;
    wire signed [15:0] x_next,y_next,xb,xa,yb,ya;
    wire signed [15:0] e2_lt_dx,e2_gt_dy;
    
    reg signed [15:0] x, y,err;
    wire in_loop, breakloop;
//--------------------------------------------------------------     
    assign x0 = stax; assign y0 = stay;
    assign x1 = endx; assign y1 = endy;
//--------------------------------------------------------------     
    //Datapath for dx, dy, right, and down
    assign Right = ((x1 - x0) > 0);
    assign dx = ((x1 - x0) > 0) ? (x1-x0) : -(x1-x0);
    assign Down = ((y1 - y0) > 0);
    assign dy = ((y1 - y0) > 0) ? -(y1-y0) : (y1-y0);
    
    //Datapath for error function (Next-state logic for err)
    assign err_next = (in_loop == 0) ? (dx+dy) : ew2;
    assign ew2 = (e2_lt_dx) ? (ew1+dx) : ew1;
    assign ew1 = (e2_gt_dy) ? (err+dy) : err;
    assign e2_gt_dy = (dy < (err<<1)); 
    assign e2_lt_dx = (dx > (err<<1));

    // Datapath for x & y (Next-state logic for x & y)
    assign x_next = (in_loop == 0) ? x0 : xb;
    assign xb = (e2_gt_dy) ? xa : x;
    assign xa = (Right) ? (x +1) : (x -1);
  
    assign y_next = (in_loop == 0) ? y0 : yb;
    assign yb = (e2_lt_dx) ? ya : y;
    assign ya = (Down) ? (y +1) : (y -1);
    
    assign breakloop = (x == x1) && (y == y1);
//-------------------------------------------------------------- 
    //State Register
    always@(posedge pclk)
        begin
            x <= x_next;
            y <= y_next;
            err <= err_next;
        end
//-------------------------------------------------------------- 
    reg state = 0, next_state;
    parameter IDLE = 0;
    parameter RUN = 1;
    
    always@(posedge pclk)
        begin
            state <= next_state;
        end
    
    always@*
        begin
            case(state)
                IDLE:   if(go == 1) next_state <= RUN;
                        else next_state <= IDLE;
                RUN:    if(breakloop == 1) next_state <= IDLE;
                        else next_state <= RUN;
            endcase
        end
    
    assign in_loop = (state == RUN);
    assign busy = in_loop;
    assign wr = in_loop;
    assign addr = {y[7:0],x[7:0]};
//-------------------------------------------------------------- 
endmodule
