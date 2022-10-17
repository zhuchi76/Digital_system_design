module	HW1_comb_gatelevel(A, B, C, D, F);
	output	F;
	input	A, B, C, D;
	//assign F = (~A & ~D) | ( (A|B) | (~B | ~C) );
	wire	 A_inv, B_inv, C_inv, D_inv, w1, w2, w3, w4;
	
	not #10 NOT1(A_inv, A);
	not #10 NOT2(B_inv, B);
	not #10 NOT3(C_inv, C);
	not #10 NOT4(D_inv, D);

	or #10 OR1(w2, A, B);
	or #10 OR2(w3, B_inv, C_inv);
	and #10 AND1(w1, A_inv, D_inv);
	and #10 AND2(w4, w2, w3);
	
	or #10 OR3(F, w1, w4);
	
	
endmodule