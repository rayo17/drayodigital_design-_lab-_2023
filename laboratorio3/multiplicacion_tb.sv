module multiplicacion_tb;

    parameter N = 4;

    logic [N-1:0] A, B;
    logic [2*N-1:0] mul_out;
    logic overflow;

    multiplicacion #(N) dut(
        .A(A),
        .B(B),
        .mul_out(mul_out),
        .overflow(overflow)
    );

    initial begin
        A = 4'b0;
        B = 4'b0;
		  
		  #10 
		  A = 4'b1010;
		  B = 4'b1010;
		  #10
		  A = 4'b1110;
		  B = 4'b1100;
		  
    end


endmodule