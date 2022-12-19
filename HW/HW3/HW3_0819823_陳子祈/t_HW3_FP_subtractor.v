`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/18 19:26:37
// Design Name: 
// Module Name: t_HW3_FP_subtractor
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


module t_HW3_FP_subtractor();
reg Clk, St;
reg [7:0] F1;
reg [4:0] E1;
reg [7:0] F2;
reg [4:0] E2;
wire [7:0] Fd;
wire [4:0] Ed;
wire Done;
wire Ovf;

integer clk_count = 0;
integer clk_count_last = 0;
integer cycle;
integer Testcase = 1;

HW3_FP_subtractor FP_sub(.Clk(Clk), .St(St), .F1(F1), .E1(E1), .F2(F2), .E2(E2), .Fd(Fd), .Ed(Ed), .Done(Done), .Ovf(Ovf));

initial begin
    // initial input
    Clk = 1'b0;
    F1 = 0; E1 = 0; F2 = 0; E2 = 0;
    St = 0;
    //test
    F1 = 8'b01010000; E1 = 5'b00101; F2 = 8'b01100000; E2 = 5'b00010;
    St = 1;
end

always #4 Clk = ~Clk;
always @(posedge Clk) clk_count = clk_count + 1;

always @(posedge Done) begin
    cycle = clk_count - clk_count_last; clk_count_last = clk_count;
    $display ("[$display] time = %0t, cycle comsuption = %0d, (%0d) th testcase, F1 = 0x%0b, E1 = 0x%0b, F2 = 0x%0b, E2 = 0x%0b, Fd = 0x%0b, Ed = 0x%0b\n", $time, cycle, Testcase, F1, E1, F2, E2, Fd, Ed);
    St = 0;
    Testcase =  Testcase + 1;
    #1;
    case(Testcase)
        2: begin F1 = 8'b01111100; E1 = 5'b00010; F2 = 8'b01000010; E2 = 5'b00011; end
        3: begin F1 = 8'b10110000; E1 = 5'b00110; F2 = 8'b10101000; E2 = 5'b01000; end
        4: begin F1 = 8'b01110011; E1 = 5'b01000; F2 = 8'b10100000; E2 = 5'b00110; end
        5: begin F1 = 8'b10010010; E1 = 5'b11011; F2 = 8'b01010000; E2 = 5'b11001; end
        6: begin F1 = 8'b01110011; E1 = 5'b01111; F2 = 8'b10011000; E2 = 5'b01111; end
        7: begin F1 = 8'b10001001; E1 = 5'b01111; F2 = 8'b01100000; E2 = 5'b01100; end
        8: begin F1 = 8'b01100010; E1 = 5'b10011; F2 = 8'b10011100; E2 = 5'b11111; end
        9: begin F1 = 8'b00000000; E1 = 5'b10000; F2 = 8'b10100111; E2 = 5'b10110; end
        10: begin F1 = 8'b01100000; E1 = 5'b10010; F2 = 8'b01100000; E2 = 5'b10010; end
    endcase
    St = 1;  
end

initial #600 $finish;

endmodule
