module ShiftRight #(N=4) (
			input logic [N-1:0] Entrada,
			input logic [N-1:0] Shift,
			output logic [N-1:0] Salida);
			
logic [N-1:0] temp1 = 0, cero = 0;
logic [2*N-1:0] temp2 = 0;

genvar s;
generate
	for (s = 0; s < N; s++)  begin : CrearShift
		ShiftBit sll (Entrada[s], temp1[s]);
	end
endgenerate	

always @(*) begin
if (Shift > N)
	Salida = 0;
else begin
	temp2 = {cero, temp1};
	$display("temp1: %b", temp2);
	Salida = temp2[Shift +: N];
end
end
endmodule
