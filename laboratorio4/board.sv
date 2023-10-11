module board (
  input wire clk,
  input wire reset,
  output reg [6:0] matrix[7:0][7:0]
);
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
            // Inicialización de la matriz en el flanco de reset
            for (int i = 0; i < 8; i = i + 1) begin
              for (int j = 0; j < 8; j = j + 1) begin
                 matrix[i][j] <= 7'b1110011; 
              end
            end
         end 
     end
endmodule 
