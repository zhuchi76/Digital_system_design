module	HW1_comb_dataflow(A, B, C, D, F);
	output	F;
	input	A, B, C, D;
	assign F = (~A & ~D) | ( (A|B) & (~B | ~C) );
	//wire	 w1;
	
	//and		G1(w1, A, B);
	//not		G2(E, C);
	//or		G3(D, w1, E);
endmodule