module sumador_nbits

#( parameter N = 4 ) 

(
	input logic [N-1:0] a,        
	input logic [N-1:0] b,
	output logic [N-1:0] result,
	output logic negativo_bandera,
	output logic zr_bandera,
	output logic cry_bandera,
	output logic of_bandera
);
	
	wire [N-1:0] carries;
	
	genvar i;
	
	generate 
		for(i=0;i<N;i=i+1)
		  begin: generateSumador
				if(i==0) 
					sumadorCompleto f(a[0],b[0],0,resultado[0],carries[0]);
				else
					sumadorCompleto f(a[i],b[i],carries[i-1],resultado[i],carries[i]);
		  end
		  
	assign zr_bandera = (resultado == 0) ? 1 : 0;
	assign negativo_bandera = resultado[N-1];
	assign cry_bandera = carries[N-1];
	assign of_bandera = ((a[N-1] + b[N-1]) != resultado[N-1]) ? 1 : 0;
	
	endgenerate

endmodule
