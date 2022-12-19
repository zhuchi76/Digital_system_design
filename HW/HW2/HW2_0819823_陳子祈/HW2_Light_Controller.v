`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/17 21:39:18
// Design Name: 
// Module Name: HW2_Light_Controller
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


module HW2_Light_Controller(LEFT, RIGHT, HAZ, CLK, LA, LB, LC, RA, RB, RC);

input LEFT, RIGHT, HAZ, CLK;
output LA, LB, LC, RA, RB, RC;
reg LA, LB, LC, RA, RB, RC;

reg [3:0]State;

initial begin
    LA=1'b0; LB=1'b0; LC=1'b0; RA=1'b0; RB=1'b0; RC=1'b0; State=0;
end

// State
always @(posedge CLK) begin  
    case(State)
        0: begin
                if(HAZ) State <= 7;
                else begin
                    if(LEFT && ~RIGHT) State <= 1;
                    else if(~LEFT && RIGHT) State <= 4;
                end
           end
        1, 2, 3: begin
                if(HAZ) State <= 7;
                else begin
                    if(LEFT && ~RIGHT)
                    begin
                        if(State == 3) State <= 0;
                        else State <= State + 1;
                    end
                    else if(~LEFT && RIGHT) State <= 9;
                    else if(~LEFT && ~RIGHT) State <= 8;
                end
           end
        4, 5, 6: begin
                if(HAZ) State <= 7;
                else begin
                    if(~LEFT && RIGHT)
                    begin
                        if(State == 6) State <= 0;
                        else State <= State + 1;
                    end
                    else if(LEFT && ~RIGHT) State <= 10;
                    else if(~LEFT && ~RIGHT) State <= 8;
                end
           end
        7: begin if(HAZ) State <= 8; else State <= 0; end
        8: begin if(HAZ) State <= 7; else State <= 0; end
        9: State <= 4;
        10: State <= 1;
    endcase  
end

// output
always @(State) begin
    case(State)
        0, 7, 8, 9, 10: begin LA<=1'b0; LB<=1'b0; LC<=1'b0; RA<=1'b0; RB<=1'b0; RC<=1'b0; end
        1: begin LA<=1'b1; LB<=1'b0; LC<=1'b0; RA<=1'b0; RB<=1'b0; RC<=1'b0; end
        2: begin LA<=1'b1; LB<=1'b1; LC<=1'b0; RA<=1'b0; RB<=1'b0; RC<=1'b0; end
        3: begin LA<=1'b1; LB<=1'b1; LC<=1'b1; RA<=1'b0; RB<=1'b0; RC<=1'b0; end
        4: begin LA<=1'b0; LB<=1'b0; LC<=1'b0; RA<=1'b1; RB<=1'b0; RC<=1'b0; end
        5: begin LA<=1'b0; LB<=1'b0; LC<=1'b0; RA<=1'b1; RB<=1'b1; RC<=1'b0; end
        6: begin LA<=1'b0; LB<=1'b0; LC<=1'b0; RA<=1'b1; RB<=1'b1; RC<=1'b1; end
    endcase
end

endmodule
