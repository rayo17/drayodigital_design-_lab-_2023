module maquinaMante(input m, clk, rst, output enable_mant, mux_error, msj);
	
  // Declaración de variables
	logic [1:0] estado, sigEstado;
	logic t;
	logic t_aux;
	wire x_mux;
	reg [7:0] contClock;
	

	// Contador de clock
	always_ff @(posedge clk or posedge rst) begin
	 if (rst) begin
		contClock <= 8'b00000000;
	 end 
	 else begin
		contClock <= contClock + 1;

	 end
	end
	  
	// verifica la cantidad de clock 
	always @* begin
		if(contClock < 200) 
		t_aux <= 0;
	else
		t_aux <= 1;
	end


	assign t = t_aux;
	
	// contador de mantenimientos
   Contador_mant Contador_mant(.reset(rst), .clk(clk), .enable_mant(enable_mant), .contMant(x_mux));	
	
	
	//Estado actual
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			estado = 2'b00;
		end
		else begin
			estado = sigEstado;
			
		end

	
  // Lógica para el siguiente estado
  // 00 estado inicial 
  // 01 estado mantenimiento
  // 10 estado compara ciclos
  // 11 estado error
  always_comb
    case(estado)
      2'b00: if (m) sigEstado = 2'b01; else sigEstado = 2'b10;
      2'b10: if (t==200) sigEstado = 2'b11; else sigEstado = 2'b00;
      2'b01: sigEstado = 2'b00;
      default: sigEstado = 2'b00;
    endcase

  // Lógica para las salidas
  
  assign enable_mant = (estado == 2'b01);
  assign mux_error = (estado == 2'b11);
   
  
  Mux Mux(.x(enable_mant), .s(mux_error), .msj(msj));

  
	

endmodule
