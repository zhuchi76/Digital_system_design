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
reg [2:0] State;
initial begin State = 0; end
always @(posedge CLK or negedge CLR)
begin
    if(~CLR) begin
        State = 0;
    end
    else begin
        case(State)
            0: State = 1;
            1: begin
               if(X == 1'b0)
                    State = 2;
               else
                    State = 3;
               end
            2: begin
               if(X == 1'b0)
                    State = 4;
               else
                    State = 5;
               end
            3: State = 5;
            4: State = 0;
            5: State = 0;       
        endcase  
    end
end

always @(posedge CLK or negedge CLR)
begin
    if(~CLR) begin
        D = 0;
        B = 0;
    end
    else begin
        D = (State == 0 && X == 1'b1) || (State == 1 && X == 1'b0) ||
        (State == 2 && X == 1'b0) || (State == 3 && X == 1'b1) ||
        (State == 4 && X == 1'b0) || (State == 5 && X == 1'b1);
        B = State == 4 && X == 1'b0;
    end
end
endmodule
