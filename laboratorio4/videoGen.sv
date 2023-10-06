module videoGen(input logic [9:0] x, y, output logic [7:0] r, g, b);
    logic inrect;

    // Define a green rectangle.
    rectgen rectgen_inst(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);
	 //rectgen rectgen_inst(x, y, 10'd0, 10'd0, 10'd639, 10'd479, inrect);

    // If inside the rectangle, display green. Otherwise, display black.
    assign g = inrect ? 8'hFF : 8'h00;
    assign r = 8'h00;
    assign b = 8'h00;
endmodule