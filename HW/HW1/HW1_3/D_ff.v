`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 02:05:09
// Design Name: 
// Module Name: D_ff
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


module D_ff(D, CLK, CLR, Q, QN);
input D, CLK, CLR;
output reg Q, QN;

initial begin
Q = 1'b0;
QN = 1'b1;
end

always @(posedge CLK or negedge CLR)
begin
    if(~CLR) begin
        Q <= 1'b0;
        QN <= 1'b1;
    end
    else begin
        Q <= D;
        QN <= ~D;
    end
end
endmodule
