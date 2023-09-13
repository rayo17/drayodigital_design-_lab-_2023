module sumadorCompleto
(
    input logic a,        
    input logic b,  
    input logic c_in,    
    output logic result,
    output logic c_out
);

    wire [2:0] w;

    xor xor1(w[0],a,b);
    xor xor2(result,w[0],c_in);
    and and1(w[1],w[0],c_in);
    and and2(w[2],a,b);
    or or1(c_out,w[2],w[1]);

endmodule
