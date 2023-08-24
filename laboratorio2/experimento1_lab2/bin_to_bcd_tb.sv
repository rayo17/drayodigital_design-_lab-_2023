module bin_to_bcd_tb();
    
	 logic a, b, c, d, b0, b1, b2, b3, b4;
    
    
    bin_to_bcd modulo(a, b, c, d, b0, b1, b2, b3, b4); 

    initial begin
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        #40

        a = 0;
        b = 0;
        c = 0;
        d = 1;
        #40

        a = 0;
        b = 1;
        c = 0;
        d = 0;
        #40

        a = 1;
        b = 0;
        c = 0;
        d = 1;
        #40

        a = 1;
        b = 0;
        c = 1;
        d = 0;
        #40

        a = 1;
        b = 1;
        c = 0;
        d = 0;
        #40

        a = 1;
        b = 1;
        c = 0;
        d = 1;
        #40

        a = 1;
        b = 1;
        c = 1;
        d = 1;
        
    end
endmodule
	
