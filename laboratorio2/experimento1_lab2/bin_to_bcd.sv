module bin_to_bcd(input logic A, B, C, D, output logic B0 ,B1, B2, B3, B4);

	assign B0 = D;
	assign B1 = (~A & C) | (~C & A & B);
	assign B2 = (~A & B) | (B & C);
	assign B3 = A & ~B & ~C;
	assign B4 = (A & B) | (A & C);

endmodule