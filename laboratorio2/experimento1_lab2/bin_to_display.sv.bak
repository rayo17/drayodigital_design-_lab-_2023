module bin_to_display(input logic A, B, C, D, output logic g, f, e, d, c, b, a);

	assign g = (~A & ~B & ~C) | (A & C & ~B)| (~A & B & C & D);
	assign f = (A & B & ~C) | (~A & C & D)| (~A & ~B & D) | (~A & ~B & C)| (~B & C & D);
	assign e = D | (~A & B & ~C) | (A & B & C);
	assign d = (~A & ~B & ~C & D) | (~A & B & ~C & ~D)| (~A & B & C & D) | (A & B & C & ~D)| (A & ~B & C & D);
	assign c = (~A & ~B & C & ~D) | (A & B & ~C & ~D);
	assign b = (~A & B & ~C & D) | (~A & B & C & ~D)| (A & B & C & D);
	assign a = (~A & ~B & ~C & D) | (~A & B & ~C & ~D)| (A & B & C & ~D) | (A & ~B & C & D);

endmodule