module random_bomb_generator(
    input wire clk,
    input wire reset,
    output reg [2:0] row,
    output reg [2:0] column
);

// Configuración básica de un pequeño MT (Mersenne Twister)
reg [15:0] mt[3:0];  // Usaremos solo 4 registros 
integer i = 0;
reg [15:0] y;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        mt[0] <= 16'h1234;  // Algunos valores iniciales
        mt[1] <= 16'h5678;
        mt[2] <= 16'h9ABC;
        mt[3] <= 16'hDEF0;
    end else begin
        y = mt[3];
        mt[3] = mt[2];
        mt[2] = mt[1];
        mt[1] = mt[0];
        mt[0] = y ^ ((y << 15) & 16'hA5A5) ^ (mt[0] >> 1) ^ mt[3];

        row = mt[0][2:0];
        column = mt[0][5:3];
    end
end

endmodule
