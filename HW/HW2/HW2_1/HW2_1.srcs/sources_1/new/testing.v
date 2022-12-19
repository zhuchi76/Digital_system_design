`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/09 21:46:46
// Design Name: 
// Module Name: HW2_BCD_to_Binary_Converter
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


module testing(
    input CLK,
    input St,
    input [11:0]BCD,
    output Done,
    output [9:0]Binary
    );
    
    reg [2:0] State;
    reg shr;
    reg cor;
    reg c9;
    reg [11:0] bcd;
    reg [9:0] binary;
    integer i;
    integer flag;
    initial
    begin
        State = 0;
        shr = 0;
        cor = 0;
        c9 = 0;
        i = 0;
        flag = 0;
    end
    always @(negedge CLK) begin
        if(i>0 && flag!=1) begin
            if(bcd[3:0]>=8 || bcd[7:4]>=8 || bcd[11:8]>=8) begin
                shr <= 0;
                cor <= 1;
            end
            else begin
                shr <= 1;
                cor <= 0;
            end
            if(i==9) begin
                c9 <= 1;
            end
            else if(i!=9) begin
                c9 <= 0;
            end
        end
        else if(i==0 || flag==0) begin
            shr <= 1;
            cor <= 0;
        end
    end 
    always @(posedge CLK) begin 
        case (State)
        0:
            begin
                if(St==1'b1) begin
                    binary <= 10'b0;
                    bcd <= BCD;
                    State <= 1;
                end
                else 
                    State <= 0;
            end
        1: // choose state
            begin
                shr <= 1;
                cor <= 0;
                State <= 2;
            end
        2://shift right state
            begin
                flag <= 0;    
                if(c9==0) begin
                    if(shr==1 && cor==0) begin
                        State <= 2;
                        binary <= {bcd[0],binary[9:1]};
                        bcd <= bcd>>1;
                        i <= i+1;
                    end // shift right
                    else if(shr==0 && cor==1) begin
                        State <= 3; 
                    end //go to state 3
                end
                else if(c9==1) begin
                    State <= 4;
                end // go to state 4
            end
        3:
            begin
                if(i==9) begin
                    c9 <= 1;
                end
                else if(i!=9) begin
                    c9 <= 0;
                end 
                if(c9==0) begin
                     State <= 2;
                     flag <= 1;
                     shr <= 1;
                     cor <= 0;
                     if(bcd[3:0] >= 8) begin
                        bcd[3:0] <= bcd[3:0] - 3;
                     end
                     if(bcd[7:4] >= 8) begin
                        bcd[7:4] <= bcd[7:4] - 3;
                     end
                     if(bcd[11:8] >= 8) begin
                        bcd[11:8] <= bcd[11:8] - 3;
                     end
                end
                else if(c9==1) begin
                    State <= 4;
                end
            end
        4:
            begin
                binary <= {bcd[0], binary[9:1]};
                bcd <= bcd >> 1;
                i <= 10;
            end
        endcase  
   end 
   
   assign Binary = binary;
   assign Done = (i==10 && bcd==0) ? 1'b1 : 1'b0;
endmodule