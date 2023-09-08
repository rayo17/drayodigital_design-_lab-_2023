module multiplicacion #(parameter N) (
	input logic [N-1:0] A, B,
	output logic [2*N-1:0] mul_out,
	output logic overflow
);

assign mul_out = A * B;

assign overflow =|mul_out[2*N-1:N/2]; // Evalua si los ultimos bits son diferente de 0

