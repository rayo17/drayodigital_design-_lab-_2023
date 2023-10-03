module Contador_mant (
  input logic clk,
  input logic reset, 
  input logic enable_mant,
  output logic [7:0] contMant
);

  logic [7:0] contAux;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      contAux <= 0;
    end
    else if (enable_mant) begin
      contAux <= contAux + 1;
    end
  end

  assign contMant = contAux;

endmodule