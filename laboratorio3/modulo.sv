module modulo #(parameter N) (
	input [N-1:0] A, B,
	output [N-1:0] out_modulo
);

	assign out_modulo = A & B;

endmodule
