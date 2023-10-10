module videoGen(
    input logic [9:0] x, y, 
    output logic [7:0] r, g, b
);

    typedef enum logic [2:0] {
        HIDDEN = 3'b000,
        REVEALED = 3'b001,
        FLAG = 3'b010,
        BOMB = 3'b011
    } cell_state_t;

    // Tablero 8x8.
    cell_state_t board[7:0][7:0];

    logic [9:0] cellX, cellY;  // Coordenadas de la celda actual.
    cell_state_t currentState; // Estado de la celda actual.
    logic inrectBG1;
    logic inrectBG2;
    
    parameter cell_width = 60;       // Ancho de la celda
    parameter cell_height = 60;      // Alto de la celda
    parameter line_thickness = 2;    // Grosor de la línea del segmento

    logic within_a_segment_coordinates;
	 logic within_segment_b;
	 logic within_segment_c;
	 logic within_segment_d;
	 logic within_segment_e;
	 logic within_segment_f;
	 logic within_segment_g;

    // Define a background rectangle of color (217,217,214).
    rectgen rectBG1(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBG1);
	 
    // Define another background rectangle of color (217,217,214).
    rectgen rectBG2(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBG2);

    // Determina qué celda estás viendo.
    assign cellX = (x - 80) / 61;
    assign cellY = y / 61;
	 
	 // Coordenadas de inicio para la primera celda
	  logic [9:0] cell_start_x = 140;
	  logic [9:0] cell_start_y = 0;
	  
	  // Estos valores representarán los porcentajes del ancho y alto de la celda como números enteros.
	 parameter int cell_width_tenth = cell_width / 10;  // 10% del ancho de la celda
	 parameter int cell_height_tenth = cell_height / 10; // 10% del alto de la celda


    always_comb begin
        currentState = board[cellX][cellY];

        // Valores por defecto.
        r = 8'h00;
        g = 8'h00;
        b = 8'h00;



		  within_a_segment_coordinates = (x > cell_start_x + cell_width_tenth) && 
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
        // Renderizar segmento 'a' si estamos dentro de sus coordenadas
        if(within_a_segment_coordinates || within_segment_b || within_segment_c || within_segment_d || within_segment_e || within_segment_f || within_segment_g) begin
            r = 8'h00;  
            g = 8'hFF;
            b = 8'h00;
        end else if (inrectBG1 || inrectBG2) begin
            r = 8'hD9;  // 217
            g = 8'hD9;  // 217
            b = 8'hD6;  // 214
        end else if ((x - 80) % 61 > 59 || y % 61 >59) begin // Si es el borde de una celda
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
        end else begin
            case (currentState)
                HIDDEN: begin
                    r = 8'h53;
                    g = 8'h56;
                    b = 8'h5B;
                end
                REVEALED: begin
                    r = 8'hB2; // 178
                    g = 8'hFF; // 255
                    b = 8'h66; // 102
                end
                FLAG: begin
                    r = 8'hFF; // 255
                    g = 8'hFF; // 255
                    b = 8'h66; // 102
                end
                BOMB: begin
                    r = 8'hFF; // 255
                    g = 8'h66; // 102
                    b = 8'h66; // 102
                end
                // otros estados
            endcase
        end
    end
endmodule
