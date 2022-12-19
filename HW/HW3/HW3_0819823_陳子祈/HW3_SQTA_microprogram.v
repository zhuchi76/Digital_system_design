`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/16 20:15:25
// Design Name: 
// Module Name: HW3_SQTA_microprogram
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


module HW3_SQTA_microprogram( Clk, Rst, X1, X2, X3, Z1, Z2, Z3 );

input Clk, Rst, X1, X2, X3;
output Z1, Z2, Z3;
reg Z1, Z2, Z3;

//reg [0:10] LUT[0:6] = {11'b01001010000,
//                      11'b11110101100,
//                      11'b10011101000,
//                      11'b00100100010,
//                      11'b01000100100,
//                      11'b00000000001,
//                      11'b10101000010};
reg [10:0] LUT[0:6];
integer State;  
integer NextState;   
reg [1:0] TEST; 
reg [10:0] LUT_row;
reg select_input;         

initial begin
    LUT[0] = 11'b01001010000;
    LUT[1] = 11'b11110101100;
    LUT[2] = 11'b10011101000;
    LUT[3] = 11'b00100100010;
    LUT[4] = 11'b01000100100;
    LUT[5] = 11'b00000000001;
    LUT[6] = 11'b10101000010;
    State = 0;
    NextState = 0;
end

always @(X1 or X2 or X3) begin
    LUT_row = LUT[State];
    TEST = LUT_row[10:9];
    case(TEST)
        0: select_input = 1'b0;
        1: select_input = X1;
        2: select_input = X2;
        3: select_input = X3;
    endcase
    case(select_input)
        1'b0: NextState = LUT_row[8:6];
        1'b1: NextState = LUT_row[5:3];
    endcase
    Z1 = LUT_row[2];
    Z2 = LUT_row[1];
    Z3 = LUT_row[0];
end
                      
always @(posedge Clk) begin
    State <= NextState;
end

endmodule
