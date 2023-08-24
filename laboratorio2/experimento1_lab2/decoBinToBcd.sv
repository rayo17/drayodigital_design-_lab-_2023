module decoBinToBcd(input logic i0, i1, i2,i3, output logic salidaDis1[6:0], salidaDis2[6:0]);

	logic  salida_bin[4:0]; //, i0, i1, i2,i3, salidaDis1[6:0], salidaDis2[6:0];
	
	bin_to_bcd decoBcd(i0, i1, i2,i3, salida_bin);
	
	bin_to_display decoDisplayUni(salida_bin[3], salida_bin[2], salida_bin[1], salida_bin[0], salidaDis1[6:0]);
	
	bit_to_display unoCeroDisplay(salida_bin[4], salidaDis2[6:0]);
	
endmodule