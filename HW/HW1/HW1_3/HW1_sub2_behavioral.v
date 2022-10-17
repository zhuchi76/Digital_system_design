`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 21:01:34
// Design Name: 
// Module Name: HW1_sub2_behavioral
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


module HW1_sub2_behavioral(D, B, X, CLK, CLR);
    output B, D;
    input X, CLK, CLR;
    reg B;
    reg D;
    reg [2:0] State;
    reg [2:0] Nextstate;
    
    initial 
    begin 
        State = 3'b0;
        Nextstate = 3'b0;
    end
    
    always @(State or X) begin
    case (State)
        3'b000: begin
            if(X==1'b0) begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 3'b001;
            end
            else begin
                B <= 1'b0;
                D <= 1'b1;
                Nextstate <= 2'b001;
            end
        end
        3'b001: begin
            if(X==1'b0) begin
                B <= 1'b0;
                D <= 1'b1;
                Nextstate <= 3'b010;
            end
            else begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 2'b011;
            end
        end
        3'b010: begin
            if(X==1'b0) begin
                B <= 1'b0;
                D <= 1'b1;
                Nextstate <= 3'b100;
            end
            else begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 3'b101;
            end
        end
        3'b011: begin
            if(X==1'b0) begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 3'b101;
            end
            else begin
                B <= 1'b0;
                D <= 1'b1;
                Nextstate <= 3'b101;
            end
        end
        3'b100: begin
            if(X==1'b0) begin
                B <= 1'b1;
                D <= 1'b1;
                Nextstate <= 3'b000;
            end
            else begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 3'b000;
            end
        end
        3'b101: begin
            if(X==1'b0) begin
                B <= 1'b0;
                D <= 1'b0;
                Nextstate <= 3'b000;
            end
            else begin
                B <= 1'b0;
                D <= 1'b1;
                Nextstate <= 3'b000;
            end
        end
        default: begin
            B <= 1'b0;
            D <= 1'b0;
            Nextstate <= 3'b000;
        end
    endcase
    end 
    always @(posedge CLK or negedge CLR) begin
        if(~CLR) begin
            State <= 3'b000;
            B <= 1'b0;
            D <= 1'b0;
        end
        else begin
            State <= Nextstate;
        end
    end
endmodule