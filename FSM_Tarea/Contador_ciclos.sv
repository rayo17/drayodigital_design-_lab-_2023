module Contador_ciclos(input reset, input clk, output t);

  reg [7:0] contClock;


  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      contClock <= 8'b00000000;
    end 
	 else begin
      contClock <= contClock + 1;

    end
  end
  
  
  Comparador comp_inst (.count_clock(contClock), .t(t)); // Instancia del módulo Comparador
  

endmodule
