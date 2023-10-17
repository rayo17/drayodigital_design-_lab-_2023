module clk_divider(
    input logic clk,
    input logic reset,
    output logic clk_out
);

    parameter DIV_FACTOR = 5000000;  // Divisor para obtener 10 Hz a partir de 50MHz

    reg [31:0] count = 0;
    reg clk_out_reg = 0;

    always_ff @(posedge clk or negedge reset) begin
        if (!reset) begin
            count <= 0;
            clk_out_reg <= 0;
        end else if (count == DIV_FACTOR - 1) begin
            count <= 0;
            clk_out_reg <= ~clk_out_reg;
        end else begin
            count <= count + 1;
        end
    end

    assign clk_out = clk_out_reg;

endmodule
