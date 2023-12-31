// Modulo encargado de colocar las minas en la matriz
module minesBoard(
    input wire clk,       
    input wire reset,      
    input logic [3:0] totalMines,
    output logic gameBoardMine[8][8]
);

    reg [2:0] bomb_row, bomb_column;
    random_bomb_generator bomb_gen(.clk(clk), .reset(reset), .row(bomb_row), .column(bomb_column));

    int counter = 0;
    //reg totalMinesChanged = 0;
    reg previousTotalMines = 0;
    
	 // inicializa todo en cero
    initial begin
        previousTotalMines = totalMines;
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                gameBoardMine[i][j] = 0; 
            end
        end
    end
     
	 // en cada cambio de clk checkea la cantidad de minas y las coloca
    always @(posedge clk) begin
        if (totalMines != previousTotalMines) begin
            //totalMinesChanged = 1;
            previousTotalMines = totalMines;
        end
    
        if(counter < totalMines) begin
            if (!gameBoardMine[bomb_row][bomb_column]) begin
                gameBoardMine[bomb_row][bomb_column] = 1;
                counter = counter +1;
            end
        end
    end
    
endmodule