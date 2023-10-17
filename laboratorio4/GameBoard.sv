module GameBoard(
	input wire clk,       
   input wire reset,      
	input logic [3:0] totalMines,
	input reg [2:0] row, 
	input reg [2:0] column,
	output logic gameBoardMine[8][8],
	output logic gameBoardRevealed[8][8],
	output int gameBoardAdjacent[8][8]
);
	 
	int counter = 0;
	//int temporary = 0;
	logic calculateAdjacent = 0;
	 
	reg totalMinesChanged = 0;
	reg previousTotalMines = 0;
	
	initial begin
		previousTotalMines = totalMines;
		$display("It changed:");
		$display(previousTotalMines);
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				gameBoardMine[i][j] = 0; 
				gameBoardRevealed[i][j] = 0;
				gameBoardAdjacent[i][j] = 0;
			end
		end
		$display("Empty board");
	end
	 
 
	 always @(posedge clk) begin
		//verficar si totalmines ha cambiado
		
		if (totalMines != previousTotalMines && previousTotalMines >= 0 && totalMines >= 0) begin
			$display("Mines have changed");
			totalMinesChanged = 1;
			previousTotalMines = totalMines;
		end
	
	
		//colocar las minas
		if(counter < totalMines) begin
			if (!gameBoardMine[row][column] && row >= 0) begin
				gameBoardMine[row][column] = 1;
				$display("Mine colocated in row: %0d column: %0d",row, column);
				counter = counter +1;
			end
		end
		//calcular ads
		if(counter == (totalMines) && ~calculateAdjacent)begin
			$display("Calculating");
			calculateAdjacent = 1;		
		end
		
		//cuando hay cambio de minas para recalcular el tablero
		if(totalMinesChanged) begin
			for (int i = 0; i < 8; i++) begin
				for (int j = 0; j < 8; j++) begin
					gameBoardMine[i][j] = 0; 
					gameBoardRevealed[i][j] = 0;
					gameBoardAdjacent[i][j] = 0;
				end
			end
			$display("Empty Board");
			$display("Total mines have changed");
			counter = 0;
			calculateAdjacent = 0;
			totalMinesChanged = 0;
		end
		
		//calculo de adyacentes
		
		if(calculateAdjacent) begin
			$display("Calculating adjacencies");
			for (int i = 0; i < 8; i++) begin
				for (int j = 0; j < 8; j++) begin
					if (!gameBoardMine[i][j]) begin
						automatic int adjacentMines = 0;
						for (int x = -1; x <= 1; x++) begin
							for (int y = -1; y <= 1; y++) begin
								if (i + x >= 0 && i + x < 8 && j + y >= 0 && j + y < 8) begin
									adjacentMines += gameBoardMine[i + x][j + y];
								end
							end
						end
						gameBoardAdjacent[i][j] = adjacentMines;
					end
				end
			end
			
			$display("adyacencias calculadas");
			calculateAdjacent = 0;
			counter = counter + 1;
			end
	 end

endmodule 