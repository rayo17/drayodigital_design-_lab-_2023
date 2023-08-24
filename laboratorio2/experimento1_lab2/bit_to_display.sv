module bit_to_display(input logic A, output logic salida[6:0]);

	assign salida[6] = 1;
	assign salida[5] = A;
	assign salida[4] = A;
	assign salida[3] = A;
	assign salida[2] = 0;
	assign salida[1] = 0;
	assign salida[0] = A;
	
endmodule