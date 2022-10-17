`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 01:52:07
// Design Name: 
// Module Name: HW1_sub2_structural
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


module HW1_sub2_structural(D, B, X, CLK, CLR);
input X, CLK, CLR;
output D, B;

wire A1, A2, A3, A4, A5, A6, A7, 
    A8, A9, A10, A11, A12, A13,
    Q0, Q0N, Q1, Q1N, Q2, Q2N, XN;

not N1(XN, X);
nand ND1(A1, Q2N, Q1N, Q0N);
nand ND2(A2, Q2N, X);
nand ND3(A3, Q1, Q0);
nand ND4(A4, A1, A2, A3);

and AND5(A5, Q2N, Q1N, Q0);

D_ff FF0(.D(A4), .CLK(CLK), .CLR(CLR), .Q(Q0), .QN(Q0N));
D_ff FF1(.D(A5), .CLK(CLK), .CLR(CLR), .Q(Q1), .QN(Q1N));
D_ff FF2(.D(Q1), .CLK(CLK), .CLR(CLR), .Q(Q2), .QN(Q2N));

nand ND6(A6, Q2N, Q1N, Q0N, X);
nand ND7(A7, Q2N, Q1N, Q0, XN);
nand ND8(A8, Q1, Q0N, XN);
nand ND9(A9, Q2, Q0N, XN);
nand ND10(A10, Q1, Q0, X);
nand ND11(A11, Q2, Q0, X);
nand ND12(A12, A6, A7, A8, A9, A10, A11);
and AND_D(D, A12, CLR);

and ND13(A13, Q2, Q0N, XN);
and AND_B(B, A13, CLR);

endmodule
