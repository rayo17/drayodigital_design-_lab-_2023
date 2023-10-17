module clock_divider (
    input logic clk_in, // Clock de entrada (50MHz en tu caso)
    output logic clk_out // Clock de salida más lento
);

    // Supongamos que deseamos obtener un clock de 1kHz a partir de 50MHz
    // 50,000,000 / 1,000 = 50,000
    logic [15:0] counter = 16'd0;

    always_ff @(posedge clk_in) begin
        if (counter == 16'd49999) begin
            clk_out <= ~clk_out;
            counter <= 16'd0;
        end else begin
            counter <= counter + 16'd1;
        end
    end

endmodule
