module board (
    input logic clk,
    input logic reset,
    input logic [3:0] totalMines,
    input logic placeMine,
    output reg [6:0] gameBoard[7:0][7:0]
);

    reg [2:0] row;
    reg [2:0] column;

    // Instancia del bombGenerator
    bombGenerator bombGen(
        .clk(clk),
        .reset(reset),
        .row(row),
        .column(column)
    );

    // Instancia del GameBoard
    GameBoard gBoard(
        .clk(clk),
        .reset(reset),
        .totalMines(totalMines),
        .placeMine(placeMine),
        .row(row),
        .column(column),
        .gameBoard(gameBoard)
    );

endmodule
