module Interfaz (
	input logic clk,
	input logic reset,
	output logic [6:0] hex1,
	output logic [6:0] hex0
);

logic [5:0] count6;

Contador #(6) test6 (clk,reset,count6);

always @(count6) begin
	case(count6[3:0])
		4'b0000:hex0=7'b1000000;
		4'b0001:hex0=7'b1111001;
		4'b0010:hex0=7'b0100100;
		4'b0011:hex0=7'b0110000;
		4'b0100:hex0=7'b0011001;
		4'b0101:hex0=7'b0010010;
		4'b0110:hex0=7'b0000010;
		4'b0111:hex0=7'b1111000;
		4'b1000:hex0=7'b0000000;
		4'b1001:hex0=7'b0010000;
		4'b1010:hex0=7'b0001000;
		4'b1011:hex0=7'b0000011;
		4'b1100:hex0=7'b1000110;
		4'b1101:hex0=7'b0100001;
		4'b1110:hex0=7'b0000110;
		4'b1111:hex0=7'b0001110;
		default:hex0=7'b1000000;
	endcase
	case(count6[5:4])
		2'b00:hex1=7'b1000000;
		2'b01:hex1=7'b1111001;
		2'b10:hex1=7'b0100100;
		2'b11:hex1=7'b0110000;
		default:hex1=7'b1000000;
	endcase
end

endmodule 