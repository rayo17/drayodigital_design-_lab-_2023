module xor_compuerta #( parameter N )
	(
		input [N-1:0] a, b, 
		output [N-1:0] out
	);
	
  assign out = a ^ b;
  
endmodule