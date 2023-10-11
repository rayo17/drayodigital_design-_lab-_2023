module tb_board;
  reg clk;
  reg reset;
  
  // Instancia Unit Under Test del módulo matriz
  board uut (
    .clk(clk),
    .reset(reset)
  );
  

  always begin
    #5 clk = ~clk;
  end

  // Reset
  initial begin
    clk = 0;
    reset = 1; // Activar reset inicialmente
    #10 reset = 0; // Desactivar reset
    #100;
    // Visualización de la matriz después del reset
    $display("Matriz después del reset:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $display("matrix[%0d][%0d] = %b", i, j, uut.matrix[i][j]);
      end
    end
 
    $finish;
  end
endmodule