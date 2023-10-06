module tb_vga();

    // Parámetros del testbench
    parameter CLK_PERIOD = 20; // Considerando que tu entrada es de 50 MHz

    // Señales del testbench
    logic clk;
    logic vgaclk;
    logic hsync, vsync, sync_b, blank_b;
    logic [7:0] r, g, b;

    // Instanciación del módulo principal (vga)
    vga uut(
        .clk(clk),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b)
    );

    // Estímulo de reloj
    always begin
        # (CLK_PERIOD / 2) clk = ~clk;
    end

    // Inicialización y monitorización
    initial begin
        // Inicialización de las señales
        clk = 0;

        // Monitorear las salidas durante un tiempo
        $monitor("At time %t: vgaclk=%b, hsync=%b, vsync=%b, sync_b=%b, blank_b=%b, r=%b, g=%b, b=%b",
                 $time, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

        // Ejecutar el testbench por un tiempo determinado
        #1000000;   // Ejemplo: Ejecutar durante 1,000,000 unidades de tiempo. Ajusta según lo que necesites.
        
        $stop;     // Terminar la simulación.
    end

endmodule
