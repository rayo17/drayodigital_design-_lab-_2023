module Dividir #(N=4) (
				input logic [N-1:0] A,
				input logic [N-1:0] B,
				output logic [N-1:0] C,
				output logic [N-1:0] D);

logic [N-1:0] Dividendo, Divisor, Resultado, Shift, tempDivisor, tempDividendo;
logic [N:0] tempResultado;
logic uno = 1, cero = 0;

always @(*) begin
	Dividendo <= A;
	Divisor <= B;
	for (int i = 0; i < N; i++) begin
		if (Divisor[N-1-i] == 1'b1) begin
			tempDivisor <= Divisor << 1;
			Shift++;
			break;
		end
	end
	for (int i = 0; i < N; i++) begin
		if (Dividendo > Divisor) begin
			tempDividendo <= Dividendo-Divisor;
			tempResultado <= {Resultado, 1'b1};
		end else tempResultado <= {Resultado, 1'b0};
		Resultado <= tempResultado;
		tempDivisor <= Divisor >> 1;
		if (Shift == 0) break;
		Shift--;
	end
	C <= A / B;
	D <= A % B;
end
endmodule
