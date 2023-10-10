module videoGen(input logic [9:0] x, y, output logic [7:0] r, g, b);
    logic inrectBG1;
    logic inrectBG2;
    logic inSquare;

    // Rectangulo lateral izq
    rectgen rectBG1(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBG1);
	 
    // Rectangulo lateral der
    rectgen rectBG2(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBG2);

    // Crea los cuadrados grices oscuros de 60 x 60
    assign inSquare = ((x-80) % 61 < 60) && (y % 61 < 60) && (x > 80) && (x < 560); 

    // Determinar colores
    assign r = (inrectBG1 | inrectBG2) ? 8'hD9 : (inSquare ? 8'h53 : 8'h00);
    assign g = (inrectBG1 | inrectBG2) ? 8'hD9 : (inSquare ? 8'h56 : 8'h00);
    assign b = (inrectBG1 | inrectBG2) ? 8'hD6 : (inSquare ? 8'h5B : 8'h00);
    
endmodule
