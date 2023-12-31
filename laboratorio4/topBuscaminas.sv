module topBuscaminas(
    input logic [3:0] cantBombas,	// Cantidad de bombas
    input logic derechaBtn_raw,		// Señal de boton horizontal
    input logic izquierdaBtn_raw,	// Señal de boton vertical
    input logic marcarBtn_raw,		// Señal de boton bandera
    input logic seleccionarBtn_raw,	// Señal de boton abrir celda
    input logic reset,					// Reset
    input logic clk, 					// para la vga
    output logic vgaclk, 				// 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, 	// To monitor & DAC
    output logic [7:0] r, g, b, 		
    output logic [6:0] cantBomDisplay, //Display de cantidad de bombas
    output logic [6:0] posiblesDisplay); //Display de cantidad de banderas

	
	logic [2:0] random_x, random_y;
	reg [3:0] bomb_count = 4'b0; 		// Contador para las bombas
	logic combined_reset; 				// Señal combinada de reset



	// Tablero
	logic [6:0] board[7:0][7:0];

	// Contador para eje x
	reg [3:0] selectedxcounter;

	// ----------- Contadores para evitar debouncing -----------------------
	always @(posedge derechaBtn_raw or negedge reset) begin
		 if (!reset)
			  selectedxcounter <= 0;
		 else if (selectedxcounter == 4'd7) // Si el contador es 7
			  selectedxcounter <= 0; // Reinicia el contador a 0
		 else 
			  selectedxcounter <= selectedxcounter + 1'b1;
	end
	
   // Contador para eje y
	reg [3:0] selectedycounter;

	always @(posedge izquierdaBtn_raw or negedge reset) begin
		 if (!reset)
			  selectedycounter <= 0;
		 else if (selectedycounter == 4'd7) // Si el contador es 7
			  selectedycounter <= 0; // Reinicia el contador a 0
		 else 
			  selectedycounter <= selectedycounter + 1'b1;
	end
		// Contador para bombas marcadas
	reg [3:0] counter0;
	always @(posedge marcarBtn_raw or negedge reset) begin
		if (!reset)
			counter0 <= 0;
		else 
			counter0 <= counter0 + 1'b1;
	end
	
	// Contador para celdas abiertas
	reg [6:0] opencounter;

	always @(posedge seleccionarBtn_raw or negedge reset) begin
		 if (!reset)
			  opencounter <= 0;
		 else if (opencounter == 6'd63) // Si el contador es 63
			  opencounter <= 0; // Reinicia el contador a 0
		 else 
			  opencounter <= opencounter + 1'b1;
	end
	// -------------------------------------------------------------------

	// Logica de la matriz del juego
	test_matrix my_board(
	    .clk(clk),
	    .reset(reset),
	    .bomb_x(2),
	    .bomb_y(2),
		 .selected_x(selectedxcounter),
		 .selected_y(selectedycounter),
		 .celdaMarcada(counter0),
		 .abrirCelda(opencounter),
		 .num_of_bombs(cantBombas),
	    .board(board)
	);
	
	// Instancia del controlador de la VGA
	vga controladorVGA(clk, board, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);
	
	// Instancia del deco para display 2
	decoder_4bit_7seg bombDis(cantBombas, cantBomDisplay);


	// Instancia del deco para display 0
	decoder_4bit_7seg posiblesDis(counter0, posiblesDisplay);

endmodule
