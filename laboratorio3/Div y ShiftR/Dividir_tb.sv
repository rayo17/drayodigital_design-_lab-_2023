`timescale 10ns/1ns
module Dividir_tb();

logic [3:0] A, B, C, D;

divisor #(4) test (A, B, C, D);


initial begin

A = 0;
repeat (16) begin
	B=1;
	#5;
	A++;
	repeat (14) begin
	#5;
	B++;
	end
end
#5;

end



endmodule
