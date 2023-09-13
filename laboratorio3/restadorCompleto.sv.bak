module restadorCompleto

(

	input logic a,        
	input logic b,  
	input logic c_in,	
	output logic resultado,
	output logic c_out


);

	wire [2:0] n;
	wire [1:0] not_w;
	
	xor u1(n[1],a,b);
	xor u2(resultado,n[1],c_in);
	not u6(not_w[0],a);
	not u5(not_w[1],n[1]);
	and u3(n[0],b,not_w[0]);
	and u4(n[2],c_in,not_w[1]);
	or u7(c_out,n[2],n[0]);
	
endmodule
	