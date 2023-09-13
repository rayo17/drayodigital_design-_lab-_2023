module ALU #(parameter N = 4) (
    input [N-1:0] A, B, // numeros de entrada
    input [3:0] sel,  // Selector de operación 
    output logic [2*N-1:0] result, // resultado binario
    output negativo_bandera,
    output zr_bandera,
    output cry_bandera,
    output of_bandera,
	 output [6:0] display1,
	 output [6:0] display2
);

    // Resultados intermedios
    wire [2*N-1:0] mul_result; 
    wire [N-1:0] mod_result, and_result, or_result, xor_result, sub_result;
    wire [N-1:0] div_result, remainder_result, shift_right_result;

    // Instancias de los módulos
    multiplicacion #(N) multiplier(.A(A), .B(B), .mul_out(mul_result));
    modulo #(N) mod_operator(.A(A), .B(B), .out_modulo(mod_result));
    and_compuerta #(N) and_gate(.a(A), .b(B), .out(and_result));
    or_compuerta #(N) or_gate(.a(A), .b(B), .out(or_result));
    xor_compuerta #(N) xor_gate(.a(A), .b(B), .out(xor_result));
    restador_nbits #(N) subtractor(.a(A), .b(B), .resultado(sub_result), 
                                   .negativo_bandera(negativo_bandera), 
                                   .zr_bandera(zr_bandera), 
                                   .cry_bandera(cry_bandera), 
                                   .of_bandera(of_bandera));
											  
    Dividir #(N) divider(.A(A), .B(B), .C(div_result), .D(remainder_result));
    ShiftRight #(N) shifter(.Entrada(A), .Shift(B), .Salida(shift_right_result));
	 
	 sumador_nbits #(N) adder(.a(A), .b(B), .result(sum_result), 
                              .negativo_bandera(),  
                              .zr_bandera(), 
                              .cry_bandera(), 
                              .of_bandera());

    // Mux para seleccionar el resultado
    always_comb begin
        case(sel)
            4'b0000: result = mul_result; // multiplicacion
            4'b0001: result = {{(N){1'b0}}, mod_result}; // modulo
            4'b0010: result = {{(N){1'b0}}, and_result}; // compuerta and
            4'b0011: result = {{(N){1'b0}}, or_result}; // compuerta or
            4'b0100: result = {{(N){1'b0}}, xor_result}; // compuerta xor
            4'b0101: result = {{(N){1'b0}}, sub_result}; // resta
            4'b0110: result = {{(N){1'b0}}, div_result}; // division
            4'b0111: result = {{(N){1'b0}}, remainder_result}; // modulo de la division
            4'b1000: result = {{(N){1'b0}}, shift_right_result}; // shift r
				4'b1001: result = {{(N){1'b0}}, sum_result}; // suma
            default: result = 0;
        endcase
    end

	 bin_to_display dis1(result[3:0], display1); // resultado a display 1
	 bin_to_display dis2(result[7:4], display2); // resultado a display 2
	 endmodule

