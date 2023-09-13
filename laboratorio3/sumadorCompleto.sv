module SumadorCompleto #(parameter N = 4) (
    input logic [N-1:0] A,  // Entrada A
    input logic [N-1:0] B,  // Entrada B
    input logic Cin,        // Entrada de acarreo
    output logic [N-1:0] Sum,  // Salida de suma
    output logic N,          // Bandera de Negativo
    output logic Z,          // Bandera de Cero
    output logic C,          // Bandera de Acarreo
    output logic V           // Bandera de Desbordamiento
);

    logic [N:0] A_ext;  // Ampliación de A para manejar desbordamiento
    logic [N:0] B_ext;  // Ampliación de B para manejar desbordamiento
    logic [N:0] Sum_ext;  // Ampliación de la suma para manejar desbordamiento

    // Ampliar las entradas A y B con un bit adicional
    always_comb begin
        A_ext = {1'b0, A};
        B_ext = {1'b0, B};
    end

    // Sumador completo
    always_ff @(posedge Cin or posedge A_ext or posedge B_ext) begin
        Sum_ext = A_ext + B_ext + Cin;
    end

    // Bandera de Negativo (N) - El bit más significativo de la suma
    assign N = Sum_ext[N];

    // Bandera de Cero (Z) - La suma es cero si todos los bits son cero
    assign Z = (Sum_ext == 0);

    // Bandera de Acarreo (C) - Lleva a cabo el acarreo
    assign C = (Sum_ext[N+1]);

    // Bandera de Desbordamiento (V) - Desbordamiento ocurre si los bits de signo son diferentes
    assign V = (A[N-1] ^ B[N-1]) & (A[N-1] ^ Sum_ext[N-1]);

    // Salida de suma de N bits
    assign Sum = Sum_ext[N-1:0];

endmodule
