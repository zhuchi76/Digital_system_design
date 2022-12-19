`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 22:33:06
// Design Name: 
// Module Name: HW3_FP_subtractor
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


module HW3_FP_subtractor(Clk, St, F1, E1, F2, E2, Fd, Ed, Done, Ovf);
input Clk, St;
input [7:0] F1;
input [4:0] E1;
input [7:0] F2;
input [4:0] E2;
output reg [7:0] Fd;
output reg [4:0] Ed;
output reg Done, Ovf;

reg [2:0] State;

reg [9:0] Fm;
reg [6:0] Em;
reg [9:0] Fs;
reg [6:0] Es;

// wire for exponent
wire [6:0] E_diff;
wire [6:0] E_diff_abs;
wire DTM, GT, LT, E_eq;
wire [6:0] Em_abs;
wire EV;
// wire for fraction
wire FV, FU;
wire [9:0] Fs_comp;
wire [9:0] Addout;
wire [9:0] Fsum; // mag of addout
wire [7:0] Fd_abs;

initial begin
    State = 0;
    Fm = 0;
    Em = 0;
    Fs = 0;
    Es = 0;
    Fd = 0;
    Ed = 0;
    Done = 0;
    Ovf = 0;
end

// Exponent comparator
assign E_diff = Em + (~Es+1);
assign E_diff_abs = (E_diff[6] == 1'b0) ? E_diff : ~E_diff + 1;
assign DTM = (E_diff_abs > 7) ? 1'b1 : 1'b0;
assign E_eq = (E_diff == 0) ? 1'b1 : 1'b0;
assign GT = (E_diff[6] == 1'b0 && ~E_eq) ? 1'b1 : 1'b0;
assign LT = (E_diff[6] == 1'b1 && ~E_eq) ? 1'b1 : 1'b0;

// Fraction substractor
assign Fs_comp = ~Fs + 1;
assign Addout = Fm + Fs_comp;
assign Fsum = (Addout[9] == 1'b0) ? Addout : ~Addout + 1;
assign FV = Fsum[9] ^ Fsum[8]; // fraction overflow
assign Fd_abs = (Fd[7] == 1'b0) ? Fd : ~Fd + 1;
assign FU = ~Fd_abs[6]; // fraction underflow

// Exponent overflow detector
assign Em_abs = (Em[6] == 1'b0) ? Em : ~Em + 1;
assign EV = Em_abs[5]; 

always @(posedge Clk) begin
    case(State)
        0: // load minuend and subtrahend
            begin
                if(St == 1'b1)
                begin
                    Fm <= {F1[7], F1[7], F1};
                    Fs <= {F2[7], F2[7], F2};
                    Em <= {E1[4], E1[4], E1};
                    Es <= {E2[4], E2[4], E2};
                    Done <= 1'b0;
                    Ovf <= 1'b0;
                    State <= 1;
                end
            end
        1: // Compare exponents & adjust fraction if necessary
            begin
                if(Fm == 0 | Fs == 0)
                    State <= 2;
                else begin
                    if(DTM == 1'b1) begin
                        if(LT == 1'b1) begin
                            Fd <= F2;
                            Ed <= E2;
                        end
                        else if(GT == 1'b1) begin
                            Fd <= F1;
                            Ed <= E1;
                        end
                        State <= 5;
                    end
                    else if(E_eq) begin
                        State <= 2;
                    end
                    else if(LT == 1'b1) begin
                        Fm <= {Fm[9], Fm[9:1]}; // shift Fm right
                        Em <= Em + 1; // inc Em
                    end
                    else if(GT == 1'b1) begin
                        Fs <= {Fs[9], Fs[9:1]}; // shift Fs right
                        Es <= Es + 1; // inc Es
                    end
                end
            end
        2: // check fraction overflow
            begin
                if(FV == 1'b0)
                    Fd <= Addout[7:0];
                else begin // fraction overflow
                    Fd <= Addout[8:1];
                    Em <= Em + 1;
                end
                State <= 3;
            end
        3: // check result for 0  
            begin
                if(Fd == 0) begin
                    Em <= 7'b0000000;
                    State <= 5;
                end
                else State <= 4;
            end
        4: // fraction unnormalized
            begin
                if(FU == 1'b0) State <= 5;
                else begin
                    Fd <= {Fd[6:0], 1'b0}; //shift left
                    Em <= Em - 1; // dec
                end
            end
        5: // check exponent overflow
            begin
                Ed <= Em[4:0];
                if(EV == 1'b1)
                    Ovf <= 1'b1;
                Done <= 1'b1;
                State <= 0;
            end
    endcase
                        
end

endmodule
