`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 17:46:34
// Design Name: 
// Module Name: t_HW2_BDC_to_Binary_Converter
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


module t_HW2_BCD_to_Binary_Converter();

reg CLK, St;
reg [11:0] BCD;
wire [9:0] Binary;
wire Done;

integer BCD_i = 0;
integer clk_count = 0;
integer clk_count_last = 0;
integer cycle;

HW2_BCD_to_Binary_Converter BCD_to_Bin(.CLK(CLK), .St(St), .BCD(BCD), .Done(Done), .Binary(Binary));
initial begin
    // initial input
    CLK = 1'b0;
    BCD = 0;
    St = 0;
    //test
    #2 BCD = 12'b100001010111; //857
    St = 1;

end

always #5 CLK = ~CLK;
always @(posedge CLK) clk_count = clk_count + 1;

always @(posedge Done) begin
    cycle = clk_count - clk_count_last; clk_count_last = clk_count;
    $display ("[$display] time = %0t, cycle comsuption = 0x%0d, BCD = 0x%0b, Binary = 0x%0d\n", $time, cycle, BCD, Binary);
    St = 0;
    BCD_i =  BCD_i + 1;
    #2;
    case(BCD_i)
        1: BCD = 12'b100110011000; //998
        2: BCD = 12'b000000100001; //021
    endcase
    St = 1;  
end

initial #650 $finish;

endmodule
