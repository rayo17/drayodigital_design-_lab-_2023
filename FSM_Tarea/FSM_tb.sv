module FSM_tb;

  // Definir los señales de entrada y salida
  reg x, clk, rst;
  wire enable_mant, mux_error, t;

  // Instancia del módulo FSM
  maquinaMante dut (
    .m(x),
    .clk(clk),
    .rst(rst),
    .enable_mant(enable_mant),
    .mux_error(mux_error)
  );

  // Generar señales de reloj
  always begin
    #1 clk = ~clk; // Alternar el reloj cada 1 unidades de tiempo
  end

  // Proceso para aplicar reset y entrada
  initial begin
  
    clk = 0; rst = 0; x = 0;
	 
	 #50 rst = 1;
	 
    // Esperar un tiempo y luego desactivar el reset
    #50 rst = 0; 

    // Ciclo de prueba
	 #250  
    x = 1; // Establecer la entrada en 1
    #20;
    x = 0; // Cambiar la entrada a 0
    #20;
    $finish; // Finalizar la simulación 
  end

endmodule
