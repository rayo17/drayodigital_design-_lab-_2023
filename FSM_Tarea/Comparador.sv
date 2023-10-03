module Comparador(input count_clock, output t);

logic t_aux;

always @* begin
  if(count_clock < 200) 
    t_aux <= 0;
  else
    t_aux <= 1;
end
 
 
 assign t = t_aux;
 
endmodule 