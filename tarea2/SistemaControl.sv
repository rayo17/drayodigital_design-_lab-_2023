module SistemaControl(
  input clk,           // Señal de reloj
  input rst,           // Señal de reset manual
  input btnPresionado, // Botón de mantenimiento presionado
  output reg [7:0] estado // Registro de estado del sistema
);

  // Definición de estados
  parameter IDLE = 3'b000; // Estado de espera
  parameter COUNT = 3'b001; // Estado de conteo

  // Definición de variables de estado
  reg [2:0] estado_actual;
  reg [7:0] contador_mantenimiento;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      estado_actual <= IDLE;
      contador_mantenimiento <= 8'b0;
      estado <= 8'h00; // Estado inicial
    end else begin
      case (estado_actual)
        IDLE: begin
          if (btnPresionado) begin
            estado_actual <= COUNT;
            contador_mantenimiento <= contador_mantenimiento + 1;
          end
          if (contador_mantenimiento == 8'hC8) begin // 200 ciclos de reloj
            estado_actual <= IDLE;
            estado <= 8'hFF; // Código de error
          end
        end
        COUNT: begin
          if (btnPresionado) begin
            contador_mantenimiento <= contador_mantenimiento + 1;
          end else begin
            estado_actual <= IDLE;
            estado <= contador_mantenimiento; // Cantidad de mantenimiento
          end
        end
      endcase
    end
  end

endmodule

