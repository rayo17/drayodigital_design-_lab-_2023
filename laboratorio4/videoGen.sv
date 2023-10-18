module videoGen(
    input logic [9:0] x, y, 
	 input logic [6:0] board[7:0][7:0],
    output logic [7:0] r, g, b
);


    logic [9:0] cellX, cellY;  		 // Coordenadas de la celda actual.
	 logic [2:0] currentState; 	    // Estado de la celda actual.
    logic inrectBG1; 					 // Barra lateral derecha
    logic inrectBG2; 					 // Barra lateral izquierda
    
    parameter cell_width = 60;       // Ancho de la celda
    parameter cell_height = 60;      // Alto de la celda
    parameter line_thickness = 2;    // Grosor de la línea del segmento

    logic within_segment_a;			 // Flag del segmento a
	 logic within_segment_b;			 // Flag del segmento b
	 logic within_segment_c;			 // Flag del segmento c
	 logic within_segment_d;			 // Flag del segmento d
	 logic within_segment_e;			 // Flag del segmento e
	 logic within_segment_f;			 // Flag del segmento f
	 logic within_segment_g;			 // Flag del segmento g
	 
	 logic [2:0] numero;					 // Numero binario actual de la celda
	 logic [6:0] segmentos;				 // Numero representado en 7 segmentos
	 
	 logic [9:0] cell_start_x;			 // Coordenada x de inicio de celda
	 logic [9:0] cell_start_y;        // Coordenada y de inicio de celda
	
    // Barra lateral izquierda.
    rectgen rectBG1(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBG1);
	 
    // Barra lateral derecha
    rectgen rectBG2(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBG2);

    // Determina qué celda esta selecc
    assign cellX = (x - 80) / 61;
    assign cellY = y / 61;
	 
	 // Determina el inicio de la celda que esta seleccionada
	 assign cell_start_x = 80 + (cellX * 61);
	 assign cell_start_y = cellY * 61;
	 
	 // Selecciona el numero de cada celda
	 assign numero = board[cellX][cellY][6:4];
	 
	 // Estos valores representarán los porcentajes del ancho y alto de la celda como números enteros.
	 parameter int cell_width_tenth = cell_width / 10;  // 10% del ancho de la celda
	 parameter int cell_height_tenth = cell_height / 10; // 10% del alto de la celda
	 
	 // Decodifica el numero a 7 segmentos
	 decoder deco(.num(numero), .display(segmentos));


    always_comb begin
		
		  // Verificar el estado actual de cada celda
        currentState = board[cellX][cellY][3:1];
		  
        // Valores por defecto.
        r = 8'h00;
        g = 8'h00;
        b = 8'h00;

			// ----------------- hacer modulo de esto ------------------------------------------
		  within_segment_a = (x > cell_start_x + cell_width_tenth) && 
                                   (x < cell_start_x + 9*cell_width_tenth) && 
                                   (y > cell_start_y + cell_height_tenth) && 
                                   (y < cell_start_y + cell_height_tenth + line_thickness);

		  // b: segmento de la derecha superior
			within_segment_b = (y > cell_start_y + cell_height_tenth) && 
									 (y < cell_start_y + 5*cell_height_tenth) && 
									 (x > cell_start_x + 9*cell_width_tenth) && 
									 (x < cell_start_x + 9*cell_width_tenth + line_thickness);

			// c: segmento de la derecha inferior
			within_segment_c = (y > cell_start_y + 5*cell_height_tenth) && 
									 (y < cell_start_y + 9*cell_height_tenth) && 
									 (x > cell_start_x + 9*cell_width_tenth) && 
									 (x < cell_start_x + 9*cell_width_tenth + line_thickness);

			// d: segmento de abajo
			within_segment_d = (x > cell_start_x + cell_width_tenth) && 
									 (x < cell_start_x + 9*cell_width_tenth) && 
									 (y > cell_start_y + 9*cell_height_tenth) && 
									 (y < cell_start_y + 9*cell_height_tenth + line_thickness);

			// e: segmento de la izquierda inferior
			within_segment_e = (y > cell_start_y + 5*cell_height_tenth) && 
									 (y < cell_start_y + 9*cell_height_tenth) && 
									 (x > cell_start_x + cell_width_tenth) && 
									 (x < cell_start_x + cell_width_tenth + line_thickness);

			// f: segmento de la izquierda superior
			within_segment_f = (y > cell_start_y + cell_height_tenth) && 
									 (y < cell_start_y + 5*cell_height_tenth) && 
									 (x > cell_start_x + cell_width_tenth) && 
									 (x < cell_start_x + cell_width_tenth + line_thickness);

			// g: segmento del medio
			within_segment_g = (x > cell_start_x + cell_width_tenth) && 
									 (x < cell_start_x + 9*cell_width_tenth) && 
									 (y > cell_start_y + 5*cell_height_tenth) && 
									 (y < cell_start_y + 5*cell_height_tenth + line_thickness);
			// ---------------------------------------------------------------------------------
			
        // Pinta el segmento si esta en posicion, si esta activo y si esta revelado
		  if(x > 80 && within_segment_a && segmentos[0] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_b && segmentos[1] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_c && segmentos[2] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_d && segmentos[3] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_e && segmentos[4] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_f && segmentos[5] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if(x > 80 && within_segment_g && segmentos[6] && currentState==3'b001 && x < 560) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if (inrectBG1 || inrectBG2) begin // Pinta barras laterales de color gris claro
            r = 8'hD9;  // 217
            g = 8'hD9;  // 217
            b = 8'hD6;  // 214
        end else if ((x - 80) % 61 > 59 || y % 61 >59) begin // Si es el borde de una celda
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
        end else begin
            case (currentState)
					 // oculto
                3'b000: begin
                    r = 8'h53;
                    g = 8'h56;
                    b = 8'h5B;
                end
					 // revelado Gris claro
                3'b001: begin
                    r = 8'hE0; // 178
                    g = 8'hE0; // 255
                    b = 8'hE0; // 102
                end
					 // Bandera
                3'b010: begin
                    r = 8'hFF; // 255
                    g = 8'hFF; // 255
                    b = 8'h66; // 102
                end
					 // bomba
                3'b011: begin
                    r = 8'hFF; // 255
                    g = 8'h66; // 102
                    b = 8'h66; // 102
                end
					 // Seleccionado
					 3'b100: begin
                    r = 8'h00; // 0
                    g = 8'h8F; // 143
                    b = 8'hFF; // 255
                end
            endcase
        end
    end
endmodule
