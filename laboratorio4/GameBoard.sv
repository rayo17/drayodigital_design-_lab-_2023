module GameBoard(
	input wire clk,       
	input wire reset,      
	input logic [3:0] totalMines,
	input logic placeMine,
	input reg [2:0] row, 
	input reg [2:0] column,
    output reg [6:0] gameBoard[7:0][7:0]
);

	int counter = 0;
	logic calculateAdjacent = 0;
	 
	typedef enum logic [2:0] {
		HIDDEN   = 3'b000,
		REVEALED = 3'b001,
		FLAG     = 3'b010,
		BOMB     = 3'b011
	} state_t;
	
	initial begin
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				gameBoard[i][j] = {3'b000, HIDDEN, 1'b0}; // Initial setup: No adjacent bombs, HIDDEN, Not selected
			end
		end
	end
	 
	always @(totalMines or reset) begin
		if (reset) begin
			for (int i = 0; i < 8; i++) begin
				for (int j = 0; j < 8; j++) begin
					gameBoard[i][j] = {3'b000, HIDDEN, 1'b0}; 
				end
			end
			counter = 0;
			calculateAdjacent = 0;
		end
	end
	 
	always @(posedge clk) begin
		if(counter < totalMines && placeMine) begin
			if (gameBoard[row][column][3:1] != BOMB) begin
				gameBoard[row][column] = {3'b000, BOMB, 1'b0}; // Place bomb
				counter = counter + 1;
			end
		end
		
		if(counter == totalMines && ~calculateAdjacent) begin
			calculateAdjacent = 1;		
		end
	end

	always @(posedge clk or posedge calculateAdjacent) begin
		if (calculateAdjacent) begin
			for (int i = 0; i < 8; i++) begin
				for (int j = 0; j < 8; j++) begin
					if (gameBoard[i][j][3:1] != BOMB) begin
						int adjacent_mines = 0;
						for (int x = -1; x <= 1; x++) begin
							for (int y = -1; y <= 1; y++) begin
								if (i + x >= 0 && i + x < 8 && j + y >= 0 && j + y < 8) begin
									if (gameBoard[i + x][j + y][3:1] == BOMB) begin
										adjacent_mines = adjacent_mines + 1;
									end
								end
							end
						end
						gameBoard[i][j][6:4] = adjacent_mines;
					end
				end
			end
		end
	end
endmodule
