
module rom_controller (reset, inc, clock, data);

	input reset, inc, clock;
	output [15:0] data;
	
	reg [4:0] addr;
	
	ROM_1 ROM_1_instance(addr, clock, data);
	
	always @(posedge clock) begin
		if (reset == 0)
			addr <= 0;
		else if (inc == 1)
			addr <= addr + 1;
	end
	
endmodule
