`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/17 01:52:37
// Design Name: 
// Module Name: t_HW1_sub2
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

module t_HW1_sub2();
reg X, CLK, CLR;
reg [31:0] X_req;
integer i;
wire D1_3_a, D1_3_b, D1_3_c, B1_3_a, B1_3_b, B1_3_c;

HW1_sub2_behavioral hw1_3_a(.D(D1_3_a), .B(B1_3_a), .X(X), .CLK(CLK), .CLR(CLR));
HW1_sub2_dataflow hw1_3_b(.D(D1_3_b), .B(B1_3_b), .X(X), .CLK(CLK), .CLR(CLR));
HW1_sub2_structural hw1_3_c(.D(D1_3_c), .B(B1_3_c), .X(X), .CLK(CLK), .CLR(CLR));

initial begin

//    X = 1'b1;
    
//    X_req[30:0] = {1'b0, 1'b0, 1'b1, 
//    1'b0, 1'b0, 1'b0, 1'b0, 
//    1'b1, 1'b1, 1'b0, 1'b1, 
//    1'b1, 1'b1, 1'b0, 1'b0, 
//    1'b0, 1'b0, 1'b1, 1'b0, 
//    1'b0, 1'b0, 1'b0, 1'b0, 
//    1'b0, 1'b0, 1'b0, 1'b0, 
//    1'b0, 1'b0, 1'b0, 1'b0};
    
    CLK = 1'b0;
    CLR = 1'b1;
    
//    for(i = 30; i >= 0; i = i-1)
//    begin
//        #5;
//        X = X_req[i];    
//    end
    
    X = 1'b1;
    #15 X = 1'b0;
//    #20 X <= 1'b0;
    #40 X = 1'b1; //#20 X = 1'b1;
    #20 X = 1'b0;
//    #20 X = 1'b0;
//    #20 X = 1'b0;
//    #20 X = 1'b0;
    #80 X = 1'b1; //#20 X = 1'b1;
//    #20 X = 1'b1;
    #40 X = 1'b0; //#20 X = 1'b0;
    #20 X = 1'b1;
//    #20 X = 1'b1;
//    #20 X = 1'b1;
    #60 X = 1'b0; //#20 X = 1'b0;
//    #20 X = 1'b0;
//    #20 X = 1'b0;
//    #20 X = 1'b0;
    #80 X = 1'b1; //#20 X = 1'b1;
    #20 X = 1'b0;
    
end

//always begin
//    for(i = 30; i >= 0; i = i-1)
//    begin
//        #5;
//        X = X_req[i];    
//    end
//end

always #10 CLK = ~CLK;
//always #35 CLR = ~CLR;
initial #400 $finish;

endmodule
