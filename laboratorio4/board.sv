module board (
    input logic rigth,
    input logic left,
    input logic up,
    input logic down,	 
    input logic selectFlag,
    input logic select,
    input wire clk,
    input wire reset,
    input logic [3:0] totalMines
	  output reg [9:0] matrix[7:0][7:0]
);

logic [2:0] state, nextState;
logic bomb = 0;
logic win = 0;
logic movement = 0;
logic placeMine = 0;

reg [2:0] row;
reg [2:0] column;


RandomGenerator r_inst (
    .clk(clk),
    .reset(reset),
    .row(row),
    .column(column)
);

// Instantiated board
GameBoard tab_ins (
    .clk(clk),
    .reset(reset),
    .totalMines(totalMines),
    .placeMine(placeMine),
    .row(row),
    .column(column)
);
  	


  always_ff @(posedge clk or posedge reset)
	if(reset) state = 3'b000;
	else
		state = nextState;

  always_comb
  begin
    case(state)
			// Estado 0
        3'b000: if (mov) nextState = 3'b111;
               else if (selectFlag) nextState = 3'b110;
               else if (select) nextState = 3'b001;
               else nextState = 3'b000;

        // Estado 1
        3'b001: if (bomb) nextState = 3'b011;  //Checks Bomb
					else if(~bomb) nextState = 3'b010;
					else nextState = 3'b001;
					
        // Estado 2
        3'b010: if (win) nextState = 3'b101; //Checks Win
					else if(~win) nextState = 3'b100;
					else nextState = 3'b010;
		  
        // Estado 3
        3'b011: nextState = 3'b011;
		  
        // Estado 4
        3'b100: nextState = 3'b000;
		  
        // Estado 5
        3'b101: nextState = 3'b101; 
		  
        // Estado 6
        3'b110: nextState = 3'b000;
		  
        // Estado 7
        3'b111: nextState = 3'b000;
		  
        default: nextState = 3'b000;
		  
    endcase
	
  end
  
  always @(nextState) begin

  
  end
  

endmodule 