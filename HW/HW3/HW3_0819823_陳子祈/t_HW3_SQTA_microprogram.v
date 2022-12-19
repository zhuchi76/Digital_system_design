`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/16 22:51:26
// Design Name: 
// Module Name: t_HW3_SQTA_microprogram
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


module t_HW3_SQTA_microprogram();
reg Clk;
reg X1, X2, X3, Rst;
reg [9:0] X1_test;
reg [9:0] X2_test;
reg [9:0] X3_test;
wire Z1, Z2, Z3;

integer clk_count = 0;

initial begin
    // initial input
    Clk = 1'b0;
    X1_test = 10'b1001010011;
    X2_test = 10'b1000110101;
    X3_test = 10'b1010001010;
    X1 = X1_test[0];
    X2 = X2_test[0];
    X3 = X3_test[0];
    Rst = 1'b0;
end

HW3_SQTA_microprogram SQTA( .Clk(Clk), .Rst(Rst), .X1(X1), .X2(X2), .X3(X3), .Z1(Z1), .Z2(Z2), .Z3(Z3) );

always #10 Clk = ~Clk;
always @(posedge Clk) #5 if(clk_count <= 10) clk_count = clk_count + 1;

always @(clk_count) begin
     X1 = X1_test[clk_count];
     X2 = X2_test[clk_count];
     X3 = X3_test[clk_count];
end

initial #300 $finish;

endmodule
