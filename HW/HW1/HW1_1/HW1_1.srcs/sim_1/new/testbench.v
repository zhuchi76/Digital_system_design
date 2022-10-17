`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 15:42:01
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
    reg A, B, C, D;
    wire F1_a, F1_b, F1_c;
    //reg clk;
    // test for HW1_comb_dataflow
    HW1_comb_dataflow comb1_a(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F1_a)
    );
    // test for HW1_comb_gatelevel
    HW1_comb_gatelevel comb1_b(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F1_b)
    );
    // test for HW1_comb_hf_gatelevel
    HW1_comb_hf_gatelevel comb1_c(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F1_c)
    );
    
    initial begin
    // initial input
    A = 0;
    B = 0;
    C = 1;
    D = 1;
    //clk = 0;
    // testA
    #50;
    A = 0;
    //testB
    #100;
    B = 1;
    //testC
//    #100;
    C = 1;
    //testD
    #100;
    D = 1;
    end
    
    //always #100 clk = ~clk;
    
    
endmodule
