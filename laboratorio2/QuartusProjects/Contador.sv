module Contador #(parameter N = 6) (
    input logic clk,      
    input logic reset,    
    output logic [N-1:0] count 
);

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        count <= {N{6'b111111}};
    end else begin
        if (count == 6'b000000) begin
            count <= {N{6'b111111}}; 
        end else begin
            count <= count - 1; 
        end
    end
end

endmodule 