module bit_to_display(input logic A, output logic g, f, e, d, c, b, a);

	assign g = 1;
	assign f = A;
	assign e = A;
	assign d = A;
	assign c = 0;
	assign b = 0;
	assign a = A;
	
endmodule