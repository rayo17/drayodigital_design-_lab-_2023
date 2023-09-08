module multiplicacion #(parameter N=4) (
	input [N-1:0] A, B,
	output [2*N-1:0] mul_out,
	output logic overflow
);

	assign mul_out = A * B;

	//assign overflow =|mul_out[2*N-1:N/2]; // Evalua si los ultimos bits son diferente de 0

endmodule

