module ALU_TB;

    parameter N = 4;

    reg [N-1:0] A, B;
    reg [3:0] sel;   
    wire [2*N-1:0] result;
    wire negativo_bandera, zr_bandera, cry_bandera, of_bandera;

    // Instancia de la ALU
    ALU #(N) Alu_TEST(
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .negativo_bandera(negativo_bandera),
        .zr_bandera(zr_bandera),
        .cry_bandera(cry_bandera),
        .of_bandera(of_bandera)
    );

    initial begin
        $display("A\tB\tSel\tResult\tNeg\tZero\tCry\tOF");

        // Ejemplo de pruebas
        // Multiplicación
        sel = 4'b0000;
        A = 4'b1010;
        B = 4'b0111;
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // Modulo
        sel = 4'b0001;
        A = 4'b1010;
        B = 4'b0111;
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // AND
        sel = 4'b0010;
        A = 4'b1010;
        B = 4'b0111;
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // OR
        sel = 4'b0011;
        A = 4'b1010;
        B = 4'b0111;
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // XOR
        sel = 4'b0100;
        A = 4'b1010;
        B = 4'b0111;
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);


		  // División
        sel = 4'b0110;
        A = 4'b1100;  // 12
        B = 4'b0100;  // 4
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // Prueba con una posible división por cero
        sel = 4'b0110;
        A = 4'b1010;
        B = 4'b0000;  // 0
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        // Desplazamiento a la derecha
        sel = 4'b1000;
        A = 4'b1010;
        B = 4'b0001;  // Desplazar por 1
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        sel = 4'b1000;
        A = 4'b1100;
        B = 4'b0010;  // Desplazar por 2
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

		          // Pruebas para suma
        sel = 4'b1001;
        A = 4'b0101;  // 5
        B = 4'b0011;  // 3
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        sel = 4'b1001;
        A = 4'b0101;  // 3
        B = 4'b1000;  // 8
        #10; $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, sel, result, negativo_bandera, zr_bandera, cry_bandera, of_bandera);

        $stop; // Terminar simulación
    end

endmodule
