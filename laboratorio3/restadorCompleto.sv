module restadorCompleto #(parameter N = 4) (
    input logic [N-1:0] A,  // Minuendo
    input logic [N-1:0] B,  // Sustraendo
    input logic Cin,        // Entrada de acarreo (usualmente en 2's complemento)
    output logic [N-1:0] Dif,  // Diferencia
    output logic N,          // Bandera de Negativo
    output logic Z,          // Bandera de Cero
    output logic C,          // Bandera de Acarreo
    output logic V           // Bandera de Desbordamiento
);

    logic [N:0] A_ext;  // Ampliación de A para manejar desbordamiento
    logic [N:0] B_ext;  // Ampliación de B para manejar desbordamiento
    logic [N:0] Dif_ext;  // Ampliación de la diferencia para manejar desbordamiento

    // Ampliar las entradas A y B con un bit adicional
    always_comb begin
        A_ext = {1'b0, A};
        B_ext = {1'b0, B};
    end

    // Restador completo
    always_ff @(posedge Cin or posedge A_ext or posedge B_ext) begin
        Dif_ext = A_ext - B_ext - Cin;
    end

    // Bandera de Negativo (N) - El bit más significativo de la diferencia
    assign N = Dif_ext[N];

    // Bandera de Cero (Z) - La diferencia es cero si todos los bits son cero
    assign Z = (Dif_ext == 0);

    // Bandera de Acarreo (C) - Se establece si no se pidió prestado (como en el préstamo en la resta decimal)
    assign C = (Dif_ext[N+1]);

    // Bandera de Desbordamiento (V) - Desbordamiento ocurre si los bits de signo son diferentes
    assign V = (A[N-1] ^ B[N-1]) & (A[N-1] ^ Dif_ext[N-1]);

    // Salida de diferencia de N bits
    assign Dif = Dif_ext[N-1:0];

endmodule

	