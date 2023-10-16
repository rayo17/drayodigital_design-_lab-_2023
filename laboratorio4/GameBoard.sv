module GameBoard(
	input wire clk,       
   input wire reset,      
	input logic [3:0] totalMines,
	input logic placeMine,
	input reg [2:0] row, 
	input reg [2:0] column
);
	 
	int counter = 0;
	int temporary = 0;
	logic calculateAdjacent = 0;
	 
	typedef struct {
		bit mine;   
		bit revealed;
		bit[3:0] adjacent;
	} cell_t;
	

	cell_t gameBoard[8][8];
	
	initial begin
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				gameBoard[i][j].mine = 0; 
				gameBoard[i][j].revealed = 0;
				gameBoard[i][j].adjacent = 0;
			end
		end
		$display("Empty board");
		temporary = totalMines;
	end
	 
	 always @(totalMines)begin
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				gameBoard[i][j].mine = 0; 
				gameBoard[i][j].revealed = 0;
				gameBoard[i][j].adjacent = 0;
			end
		end
		$display("Empty board");
		
		$display("Total mines have changed");
		counter = 0;
		calculateAdjacent = 0;
	 end
	 
	 always @(posedge clk) begin
		if(counter < totalMines) begin
			if (!gameBoard[row][column].mine && row >= 0) begin
				gameBoard[row][column].mine = 1;
				$display("mina colocada en fila: %0d columna: %0d",row, column);
				counter = counter +1;
			end
		end
		
		if(counter == (totalMines) && ~calculateAdjacent)begin
			$display("calculated");
			calculateAdjacent = 1;		
		end
	 end

	
	always @( posedge calculateAdjacent) begin
	$display("calculando adyacencias");
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				if (!gameBoard[i][j].mine) begin
					automatic int adjacent_mines = 0;
					for (int x = -1; x <= 1; x++) begin
						for (int y = -1; y <= 1; y++) begin
							if (i + x >= 0 && i + x < 8 && j + y >= 0 && j + y < 8) begin
								adjacent_mines += gameBoard[i + x][j + y].mine;
							end
						end
					end
					gameBoard[i][j].adjacent = adjacent_mines;
				end
			end
		end
		// Matrix printed
		for (int row = 0; row < 8; row = row + 1) begin
			for (int col = 0; col < 8; col = col + 1) begin
                    $display("matrix[%0d][%0d]", row, col);
						  $display(gameBoard[row][col].adjacent);
			end
		end
	$display("Bombs close");
	end

endmodule