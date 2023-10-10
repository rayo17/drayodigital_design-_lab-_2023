module decoder(input logic [2:0] num, output logic [6:0] display);

always_comb begin
	display = 7'b0000000;
	case (num)
		3'b000: display = 7'b0111111 ;
		3'b001: display = 7'b0000110;
		3'b010: display = 7'b1011011;
		3'b011: display = 7'b1001111;
		3'b100: display = 7'b1100110;
		3'b101: display = 7'b1101101;
		3'b110: display = 7'b1111101;
		3'b111: display = 7'b0000111;
		default: display = 7'b0000000;
	endcase	
end
endmodule
