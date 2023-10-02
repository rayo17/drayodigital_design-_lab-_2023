module SistemaControl;

  typedef enum logic [1:0] {
    ESPERANDO,
    MANTENIMIENTO,
    ERROR
  } estado_t;

  reg [1:0] estado_actual, estado_siguiente;
  reg [7:0] contador_tiempo;
  reg [7:0] contador_mantenimiento;
  reg error_flag;
  reg [7:0] estado_registro;
  reg reloj;
  reg boton_presionado; 
  reg reset;

  parameter TIEMPO_MAXIMO = 200;

  always @(posedge reloj) begin
    if (reset) begin
      estado_actual <= ESPERANDO;
    end else begin
      estado_actual <= estado_siguiente;
    end
  end

  always @(posedge reloj) begin
    if (estado_actual == ESPERANDO) begin
      if (boton_presionado) begin
        contador_mantenimiento <= contador_mantenimiento + 1;
        estado_registro <= contador_mantenimiento;
        estado_siguiente <= MANTENIMIENTO;
      end else if (contador_tiempo >= TIEMPO_MAXIMO) begin
        estado_registro <= 8'hFF; // Código de error 0xFF
        estado_siguiente <= ERROR;
        error_flag <= 1'b1;
      end else begin
        contador_tiempo <= contador_tiempo + 1;
        estado_siguiente <= ESPERANDO;
      end
    end else if (estado_actual == MANTENIMIENTO) begin
      contador_tiempo <= 0;
      estado_siguiente <= ESPERANDO;
    end else begin
      estado_siguiente <= ERROR;
    end
  end

endmodule
