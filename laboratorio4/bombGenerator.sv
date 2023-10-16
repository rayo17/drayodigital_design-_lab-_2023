module bombGenerator(
  input wire clk,     // Clock
  input wire reset,     // Reset
  output reg [2:0] row, 
  output reg [2:0] column 
);

  reg [15:0] lfsr_row; // LFSR = linear feedback shift register
  reg [15:0] lfsr_column;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      lfsr_row =  16'h0001; 
      lfsr_column =  16'h001C; // Initial Values
    end else begin
      lfsr_row = {lfsr_row[0] ^ lfsr_row[2], lfsr_row[15:1]}; 
      lfsr_column = {lfsr_column[0] ^ lfsr_column[3], lfsr_column[15:1]}; // LFSR of 16 bits
      row = lfsr_row[2:0];
      column = lfsr_column[2:0]; // to generate the pseudorandom numbers
    end
  end

endmodule
