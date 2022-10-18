`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 21:44:46
// Design Name: 
// Module Name: t_HW1_delay
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


module t_HW1_delay(
    );
    
    wire C1, C2, C3, C4, C5;
    reg A, B;
    
    HW1_delay hw1_2(
        .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .A(A), .B(B)
    );
    
    initial begin
    A = 0;
    B = 0;
    #4; // 4
    B = 1;
    #6; // 10
    B = 0;
    #5; // 15
    B = 1;
    #5; // 20
    B = 0;
    #10; // 30
    B = 1;
    #10; // 40
    B = 0;
    
    //force B 0 0, 1 4, 0 10, 1 15, 0 20, 1 30, 0 40;
    
    end
    
    initial #50 $finish;
    
endmodule
