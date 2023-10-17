module random_bomb_generator(
  input wire clk,     // Clock
  input wire reset,   // Reset
  output reg [2:0] row, 
  output reg [2:0] column 
);

  reg [15:0] lfsr_row; // LFSR = linear feedback shift register
  reg [15:0] lfsr_column;
  reg [15:0] internal_counter = 0;
  logic generate_coord; // Señal de generación

  always @(posedge clk or posedge reset) begin
    if (reset) 
        internal_counter <= 0;
    else if (generate_coord)
        internal_counter <= internal_counter + 1;
  end

  assign generate_coord = (internal_counter == 16383); // Genera coordenadas cada 16384 ciclos

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      lfsr_row = 16'h0001; 
      lfsr_column = 16'h001C; // Valores iniciales
    end else if (generate_coord) begin // Modifica la generación de coordenadas para que sólo ocurra cuando generate_coord es alto
      lfsr_row = {lfsr_row[0] ^ lfsr_row[2], lfsr_row[15:1]}; 
      lfsr_column = {lfsr_column[0] ^ lfsr_column[3], lfsr_column[15:1]}; 
      row = lfsr_row[2:0];
      column = lfsr_column[2:0];
    end
  end

endmodule
