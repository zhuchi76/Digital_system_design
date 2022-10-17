`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 21:44:13
// Design Name: 
// Module Name: HW1_delay
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


module HW1_delay(
    C1, C2, C3, C4, C5, A, B
    );
    input A, B;
    output  C1, C2, C3, C4, C5;
    reg C1, C2, C3, C4;
    
    always @(A, B)
    begin
    #5 C1 <= A ^ B;
    end
    
    always @(A, B)
    begin
    #5 C2 = A ^ B;
    end
    
    always @(A, B)
    begin
    C3 <= #5 A ^ B;
    end
    
    always @(A, B)
    begin
    C4 = #5 A ^ B;
    end
    
    assign #5 C5 = A ^ B;

endmodule
