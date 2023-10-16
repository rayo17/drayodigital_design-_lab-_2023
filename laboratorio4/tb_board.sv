module tb_board;

	logic rigth = 0;
	logic left = 0;
	logic up = 0;
	logic down = 0;
	logic selectFlag = 0;
	logic select = 0;
	reg clk;
	reg rst;
	logic [3:0] totalMines;
	
	
	busca_minas busca_minas_inst (
    .rigth(rigth),
	 .left(left),
	 .up(up),
	 .down(down),
    .selectFlag(selectFlag),
    .select(select),
    .clk(clk),
    .reset(reset),
    .totalMines(totalMines)
);

  always #5 clk = ~clk;

  initial begin
	totalMines = 5;
    clk = 0;
    reset = 0; 
     
    // Reset
    reset = 1;
    #10 reset = 0;

    #100;
	 $display("-------------------------------------------------------------------------------");
    totalMines=10;
  end

endmodule 