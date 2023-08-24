module decoBinToBcd();

	logic [4:0] salida_bin, i0, i1, i2,i3, salidaDis1[6:0], salidaDis2[6:0];
	
	bin_to_bcd decoBcd(i0, i1, i2,i3, salida_bin);
	
	bin_to_display decoDisplayUni(salida_bin[3:0], salidaDis1[6:0]);
	
	bit_to_display(salida_bin[4], salidaDis2[6:0]);
	
endmodule