module tb_board;
	logic movement = 0;
	logic rigth = 0;
	logic left = 0;
	logic up = 0;
	logic down = 0;
	logic selectFlag = 0;
	logic select = 0;
	reg clk;
	reg rst;
	logic [3:0] totalMines;
	
	
	board board_inst (
	 .movement(movement),
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

  always #15 clk = ~clk;

  initial begin
	totalMines = 5;
    clk = 0;
    reset = 0; 
     
    // Reset
    reset = 1;
    #10 reset = 0;

    // Espera un tiempo para observar la secuencia de números aleatorios generada
    #150;
	 $display("-------------------------------------------------------------------------------");
	 movement=1;
	 #100;
	 movement=0;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	 
	 rigth=1;
	 left=1;
	 #10;
	 rigth=0;
	 left=0;
	 #10;
	end
endmodule 