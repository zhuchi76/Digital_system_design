`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 13:46:43
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
     
     wire nX, Q0, nQ0, Q1, nQ1, Q2, nQ2, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13;
     
     not not0(nQ0, Q0);
     not not1(nQ1, Q1);
     not not2(nQ2, Q2);
     not not3(nX, X);
     
     and and1(g1, nQ2, nQ1, nQ0);
     and and2(g2, nQ2, nQ1, Q0);
     and and3(g3, nQ2, X);
     and and4(g4, Q1, Q0);
     
     or or1(g5, g1, g3, g4);
     
     D_ff ff0(.D(g5), .CLK(CLK), .CLR(CLR), .Q(Q0), .QN(nQ0));
     D_ff ff1(.D(g2), .CLK(CLK), .CLR(CLR), .Q(Q1), .QN(nQ1));
     D_ff ff2(.D(Q1), .CLK(CLK), .CLR(CLR), .Q(Q2), .QN(nQ2));
     
     and and5(g6, nQ2, nQ1, nQ0, X);
     and and6(g7, nQ2, nQ1, Q0, nX);
     and and7(g8, Q1, nQ0, nX);
     and and8(g9, Q2, nQ0, nX);
     and and9(g10, Q1, Q0, X);
     and and10(g11, Q2, Q0, X);
     
     or or2(g12 , g6, g7, g8, g9, g10, g11);
     
     and andD(D, g12, CLR);
     
     and andB(B, g9, CLR);
endmodule