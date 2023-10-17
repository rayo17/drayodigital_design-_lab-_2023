module contador_4bits (
    input logic marcarBtn_raw,   // Botón de incremento
    input logic reset,           // Señal de reset
    output reg [3:0] counter0   // Salida del contador de 4 bits
);

// Lógica del contador
always @(posedge marcarBtn_raw or negedge reset) begin
    if (!reset)
        counter0 <= 0;  // Reset del contador a 0
    else
        counter0 <= counter0 + 1'b1;  // Incrementa el contador
    // Nota: El contador se desbordará si no tienes un control sobre el valor máximo que puede alcanzar.
end

endmodule

