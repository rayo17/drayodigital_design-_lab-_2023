module SistemaControl_tb;

  reg clk;
  reg rst;
  reg btnPresionado;
  wire [7:0] estado;

  initial begin
    // Inicializa las señales
    clk = 0;
    rst = 0;
    btnPresionado = 0;

    // Realiza un reset manual
    rst = 1;
    #10 rst = 0;

    // Presiona el botón durante 200 ciclos
    btnPresionado = 1;
    #200 btnPresionado = 0;

    // Presiona el botón nuevamente después de un tiempo
    #10 btnPresionado = 1;

    // Espera un tiempo
    #50;

    // Termina la simulación
    $finish;
  end

  // Simulación del reloj
  always begin
    #5 clk = ~clk;
  end

  // Instancia del módulo
  SistemaControl dut (
    .clk(clk),
    .rst(rst),
    .btnPresionado(btnPresionado),
    .estado(estado)
  );

  // Visualización de resultados
  always @(posedge clk) begin
    $display("Estado: %h", estado);
  end

endmodule

