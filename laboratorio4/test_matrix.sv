module test_matrix(
    input logic clk,
    input logic reset,
    input [2:0] bomb_x,      
    input [2:0] bomb_y,  
    input [2:0] selected_x,
    input [2:0] selected_y,   
    input [2:0] celdaMarcada,
    input [6:0] abrirCelda,
    output logic [6:0] board[7:0][7:0]
);

typedef enum logic [2:0] {
    HIDDEN   = 3'b000,
    REVEALED = 3'b001,
    FLAG     = 3'b010,
    BOMB     = 3'b011,
    SELECTED = 3'b100
} state_t;

state_t real_state[7:0][7:0];

reg [2:0] prev_selected_x;
reg [2:0] prev_selected_y;
reg [2:0] prev_celdaMarcada;
reg [6:0] prev_abrirCelda;

always_ff @(posedge clk or negedge reset) begin
    if (!reset) begin
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                real_state[i][j] = HIDDEN;
                board[i][j][6:4] = 3'b000; 
                board[i][j][3:1] = HIDDEN;
                board[i][j][0] = 1'b0; 
            end
        end
        prev_selected_x <= 3'b000;
        prev_selected_y <= 3'b000;
        prev_celdaMarcada <= 3'b000;
        prev_abrirCelda <= 6'b000000;
    end 
    else begin
        if (abrirCelda != prev_abrirCelda) begin
				if (board[selected_x][selected_y][0]) begin
					real_state[selected_x][selected_y] = BOMB;
				end else begin
					real_state[selected_x][selected_y] = REVEALED;
				end
        end else if (celdaMarcada != prev_celdaMarcada) begin
            real_state[selected_x][selected_y] = FLAG;
        end 

        // Actualizar la matriz de salida board según real_state
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                if (i == selected_x && j == selected_y) begin
                    board[i][j][3:1] = SELECTED;
                end else begin
                    board[i][j][3:1] = real_state[i][j];
                end
            end
        end

        board[bomb_x][bomb_y][6:4] = 3'b000;
        //board[bomb_x][bomb_y][3:1] = BOMB;
        board[bomb_x][bomb_y][0] = 1'b1;

        prev_selected_x <= selected_x;
        prev_selected_y <= selected_y;
        prev_celdaMarcada <= celdaMarcada;
        prev_abrirCelda <= abrirCelda;
    end
end

endmodule
