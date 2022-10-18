`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 02:04:08
// Design Name: 
// Module Name: HW1_sub2_behavioral
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HW1_sub2_behavioral(D, B, X, CLK, CLR);

input X, CLK, CLR;
output reg D, B;
//output wire D, B;
reg [2:0] State;
reg [2:0] NextState;
initial begin 
State = 0; 
NextState = 0;
end

//always @(State or X)
//begin    
//    case(State)
//        0: begin
//               if(X == 1'b0) begin NextState <= 1; D <= 1'b0; B <= 1'b0; end
//               else begin NextState <= 1; D <= 1'b1; B <= 1'b0; end
//           end
//        1: begin
//               if(X == 1'b0) begin NextState <= 2; D <= 1'b1; B <= 1'b0; end
//               else begin NextState <= 3; D <= 1'b0; B <= 1'b0; end
//           end
//        2: begin
//               if(X == 1'b0) begin NextState <= 4; D <= 1'b1; B <= 1'b0; end
//               else begin NextState <= 5; D <= 1'b0; B <= 1'b0; end
//           end
//        3: begin
//               if(X == 1'b0) begin NextState <= 5; D <= 1'b0; B <= 1'b0; end
//               else begin NextState <= 5; D <= 1'b1; B <= 1'b0; end
//           end
//        4: begin
//               if(X == 1'b0) begin NextState <= 0; D <= 1'b1; B <= 1'b1; end
//               else begin NextState <= 0; D <= 1'b0; B <= 1'b0; end
//           end
//        5: begin
//               if(X == 1'b0) begin NextState <= 0; D <= 1'b0; B <= 1'b0; end
//               else begin NextState <= 0; D <= 1'b1; B <= 1'b0; end
//           end
//        default: begin NextState <= 0; D <= 1'b0; B <= 1'b0; end
//    endcase  
//end

always @(State or X)
begin    
    case(State)
        0: NextState <= 1;
        1: begin
               if(X == 1'b0) NextState <= 2;
               else NextState <= 3;
           end
        2: begin
               if(X == 1'b0) NextState <= 4;
               else NextState <= 5;
           end
        3: NextState <= 5;
        4: NextState <= 0;
        5: NextState <= 0;
        default: NextState <= 0;
    endcase  
    
end

always @(posedge CLK or negedge CLR)
begin
    if(~CLR) begin
        State <= 0;
    end
    else begin
        State <= NextState;
    end
end

always @(*)
begin
    if(~CLR) begin
        D = 1'b0; 
        B = 1'b0;
    end
    else begin
        D = (State == 0 && X == 1'b1) || (State == 1 && X == 1'b0) ||
        (State == 2 && X == 1'b0) || (State == 3 && X == 1'b1) ||
        (State == 4 && X == 1'b0) || (State == 5 && X == 1'b1);
        
        B = State == 4 && X == 1'b0;
    end
end
//assign  D = ( (State == 0 && X == 1'b1) || (State == 1 && X == 1'b0) ||
//        (State == 2 && X == 1'b0) || (State == 3 && X == 1'b1) ||
//        (State == 4 && X == 1'b0) || (State == 5 && X == 1'b1) ) && CLR;
        
//assign  B = State == 4 && X == 1'b0 && CLR;

endmodule
