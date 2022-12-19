`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 21:39:50
// Design Name: 
// Module Name: t_HW2_Light_Controller
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


module t_HW2_Light_Controller();

reg LEFT, RIGHT, HAZ, CLK;
wire LA, LB, LC, RA, RB, RC;

HW2_Light_Controller light(.LEFT(LEFT), .RIGHT(RIGHT), .HAZ(HAZ), .CLK(CLK), .LA(LA), .LB(LB), .LC(LC), .RA(RA), .RB(RB), .RC(RC));

initial begin
    CLK = 1'b0;
    
    HAZ = 1'b0;

    #5; LEFT = 1'b1; RIGHT = 1'b0;
    #100; HAZ = 1'b1;
    #40; HAZ = 1'b0;
    
    #20; LEFT = 1'b0; RIGHT = 1'b1;
    #100; HAZ = 1'b1;
    #40; HAZ = 1'b0;
    
    #20; LEFT = 1'b1; RIGHT = 1'b0;
    #100; LEFT = 1'b0; RIGHT = 1'b1;
    #110; LEFT = 1'b1; RIGHT = 1'b0;
    
    #100 $finish;
end

always #10 CLK = ~CLK;

endmodule
