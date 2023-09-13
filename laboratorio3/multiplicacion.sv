module multiplicacion #(parameter N=4) (
	input [N-1:0] A, B,
	output [2*N-1:0] mul_out
);

	assign mul_out = A * B;

endmodule

