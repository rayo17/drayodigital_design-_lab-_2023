module bin_to_bcd(input logic A, B, C, D, output salida[4:0]);

	assign salida[0] = D;
	assign salida[1] = (~A & C) | (~C & A & B);
	assign salida[2] = (~A & B) | (B & C);
	assign salida[3] = A & ~B & ~C;
	assign salida[4] = (A & B) | (A & C);

endmodule