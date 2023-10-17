module debouncer 
	// Parameters section
	# (parameter CLOCK_FREQ = 50_000_000,
		parameter STABLE_TIME_ms = 10
		)
	// Ports section
	(
	input clk,
	input rst_n,
	input i_debounce,
	output o_debounce
	);
	
	localparam COUNTER_MAX = (CLOCK_FREQ*STABLE_TIME_ms)/1000;
	
	// internal logic
	reg [1:0] ff_i;
	reg ff_o;
	reg [23:0] counter;
	
	wire clear_counter;
	wire counter_max;
	
	// flip flops
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			ff_i <= 0;
		end else begin
			ff_i[1:0] <= {ff_i[0], i_debounce};
		end
	end
	
	assign clear_counter = ^ff_i;
	
	// create counter
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			counter <= 0;
		end else if (clear_counter || counter_max) begin
			counter <= 0;
		end else begin 
			counter <= counter + 1'b1;
		end
	end
	
	assign counter_max = (counter == COUNTER_MAX);
	
	// create the output data logic
	
	always  @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			ff_o <= 0;
		end else if (counter_max) begin
			ff_o <= ff_i[1];
		end
	end
	
	assign o_debounce = ff_o;
endmodule 