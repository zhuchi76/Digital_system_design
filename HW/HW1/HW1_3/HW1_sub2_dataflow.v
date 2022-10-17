`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/15 16:07:37
// Design Name: 
// Module Name: HW1_sub2_dataflow
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


module HW1_sub2_dataflow(D, B, X, CLK, CLR);
    input X, CLK, CLR;
    output D, B;
    reg Q2, Q1, Q0;
    wire D, B;
    initial begin
        Q2 = 1'b0;
        Q1 = 1'b0;
        Q0 = 1'b0;
    end
    always @(posedge CLK or negedge CLR) begin
        if(~CLR) begin
            Q2 <= 1'b0;
            Q1 <= 1'b0;
            Q0 <= 1'b0;
        end
        else begin
            Q2 <= Q1;
            Q1 <= ~Q2 & ~Q1 & Q0;
            Q0 <= (~Q2 & ~Q1 & ~Q0) | (~Q2 & X) | (Q1 & Q0);
         end
    end
    assign D = (~Q2 & ~Q1 & ~Q0 & X) | (~Q2 & ~Q1 & Q0 & ~X) | (Q1 & ~Q0 & ~X) | (Q2 & ~Q0 & ~X) | (Q1 & Q0 & X) | (Q2 & Q0 & X);
    assign B = Q2 && ~Q0 && ~X;
endmodule