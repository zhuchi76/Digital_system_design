`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 17:45:56
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


module HW2_BCD_to_Binary_Converter(CLK, St, BCD, Done, Binary);
input CLK, St;
input [11:0] BCD;
output Done;
output [9:0] Binary;

// control citcuit variable definition
reg [3:0] State;
reg Shr, C9;

reg flag;

initial begin
    State = 0;
    Shr = 1'b0; 
    C9 = 1'b0;
    flag = 1'b0;
end

// datapath circuit variable definition
reg [11:0] A;
reg [9:0] B;
reg [3:0] counter;

initial begin
    A = 0;
    B = 0;
    counter = 0;
end

always @(posedge CLK) begin
    case(State)
        0: begin 
               Shr = 1'b0; 
               C9 = 1'b0;
               flag = 1'b0;
               A = 0;
               B = 0;
               counter = 0;
               if(St) begin State <= 1; A <= BCD; end
               else State <= 0;
           end
        1: begin State <= 2; Shr <= 1'b1; end
        2: begin
               flag <= 1'b0;
               if(C9) State <= 4;
               else begin
                    if(Shr == 1'b1) 
                        begin 
                            State <= 2; 
                            A <= {1'b0, A[11:1]}; 
                            B <= {A[0], B[9:1]}; 
                            counter <= counter + 1;
                        end
                    else State <= 3;
               end     
           end
        3: begin
               if(C9) State <= 4;
               else begin
                   State <= 2;
                   flag <= 1'b1;
                   Shr <= 1'b1;
                   if(A[3]) A[3:0] <= A[3:0] - 3;
                   if(A[7]) A[7:4] <= A[7:4] - 3;
                   if(A[11]) A[11:8] <= A[11:8] - 3;
               end
           end
        4: begin A <= {1'b0, A[11:1]}; B <= {A[0], B[9:1]}; State <= 0; end
    endcase
end

always @(negedge CLK) begin
   if(counter > 0 && flag == 1'b0) 
       begin
            if(A[3] || A[7] || A[11]) Shr <= 1'b0;
            else Shr <= 1'b1;
       end
   else if(counter == 0 || flag == 1'b0)
       begin
           Shr <= 1'b1;
       end
end

always @(counter) begin
    C9 <= (counter == 10);
end

assign Binary = B;
assign Done = C9;

endmodule
