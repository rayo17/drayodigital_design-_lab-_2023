`timescale 10ns/1ns
module ShiftRight_tb();

logic [3:0] A, B, Shift;

ShiftRight #(4) test (A, Shift, B);

initial begin

A=4'b0001;
repeat (12) begin
Shift=1;
	repeat (6) begin
		
		#5;
		assert (B === A>>Shift) else $error("Error en Shift %d y A %d", Shift, A);
		Shift=Shift + 1;
	end
A=A + 1;
end
end

endmodule
