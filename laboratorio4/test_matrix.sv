module test_matrix(
  output logic [6:0] board[7:0][7:0]
);

  typedef enum logic [2:0] {
    HIDDEN   = 3'b000,
    REVEALED = 3'b001,
    FLAG     = 3'b010,
    BOMB     = 3'b011
  } state_t;

  initial begin
    // Llenando con el estado HIDDEN
    for (int i = 0; i < 2; i++) begin
      for (int j = 0; j < 8; j++) begin
        board[i][j][6:4] = 3'b001; // Sólo un número binario de ejemplo
        board[i][j][3:1] = HIDDEN;
        board[i][j][0] = 1'b0; // Poniendo el bit 0 para este ejemplo
      end
    end

    // Llenando con el estado REVEALED
    for (int i = 2; i < 4; i++) begin
      for (int j = 0; j < 8; j++) begin
        board[i][j][6:4] = 3'b010; // Sólo un número binario de ejemplo
        board[i][j][3:1] = REVEALED;
        board[i][j][0] = 1'b1; // Poniendo el bit 1 para este ejemplo
      end
    end

    // Llenando con el estado FLAG
    for (int i = 4; i < 6; i++) begin
      for (int j = 0; j < 8; j++) begin
        board[i][j][6:4] = 3'b011; // Sólo un número binario de ejemplo
        board[i][j][3:1] = FLAG;
        board[i][j][0] = 1'b0; // Poniendo el bit 0 para este ejemplo
      end
    end

    // Llenando con el estado BOMB
    for (int i = 6; i < 8; i++) begin
      for (int j = 0; j < 8; j++) begin
        board[i][j][6:4] = 3'b100; // Sólo un número binario de ejemplo
        board[i][j][3:1] = BOMB;
        board[i][j][0] = 1'b1; // Poniendo el bit 1 para este ejemplo
      end
    end

  end

endmodule
