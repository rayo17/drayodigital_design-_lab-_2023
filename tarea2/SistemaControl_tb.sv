`timescale 1ns / 1ps

module SistemaControl_tb;

  reg reloj;
  reg boton_presionado;
  reg reset;
  wire [1:0] estado_actual;
  wire error_flag;
  wire [7:0] estado_registro;
  
  // Instancia del módulo a probar
  SistemaControl uut (
    .reloj(reloj),
    .boton_presionado(boton_presionado),
    .reset(reset),
    .estado_actual(estado_actual),
    .error_flag(error_flag),
    .estado_registro(estado_registro)
  );

  initial begin
    reloj = 0;
    boton_presionado = 0;
    reset = 0;

    // Inicializamos las señales
    estado_actual = 2'b00;
    error_flag = 1'b0;
    estado_registro = 8'b00000000;

    // Comenzamos la simulación
    #10 reset = 1; // Activa el reset
    #10 reset = 0; // Desactiva el reset

    // Simulamos el mantenimiento
    boton_presionado = 1;
    #10 boton_presionado = 0;
    #10 boton_presionado = 1;
    #10 boton_presionado = 0;

    // Simulamos la espera hasta el error
    #200;

    // Simulamos un reset manual
    reset = 1;
    #10 reset = 0;

    // Terminamos la simulación
    $finish;
  end

  always begin
    #5 reloj = ~reloj; // Genera el pulso del reloj
  end

endmodule
