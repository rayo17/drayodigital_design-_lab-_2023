module Mux(input x, s, output msj);

  parameter msj_error = 8'hFF;
  assign msj = (s!=1) ? x : msj_error;

endmodule
