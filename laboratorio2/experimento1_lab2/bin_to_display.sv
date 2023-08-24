module bin_to_display(input logic A, B, C, D, output logic salida[6:0]);

	assign salida[6] = (~A & ~B & ~C) | (A & C & ~B)| (~A & B & C & D);
	assign salida[5] = (A & B & ~C) | (~A & C & D)| (~A & ~B & D) | (~A & ~B & C)| (~B & C & D);
	assign salida[4] = D | (~A & B & ~C) | (A & B & C);
	assign salida[3] = (~A & ~B & ~C & D) | (~A & B & ~C & ~D)| (~A & B & C & D) | (A & B & C & ~D)| (A & ~B & C & D);
	assign salida[2] = (~A & ~B & C & ~D) | (A & B & ~C & ~D);
	assign salida[1] = (~A & B & ~C & D) | (~A & B & C & ~D)| (A & B & C & D);
	assign salida[0] = (~A & ~B & ~C & D) | (~A & B & ~C & ~D)| (A & B & C & ~D) | (A & ~B & C & D);

endmodule