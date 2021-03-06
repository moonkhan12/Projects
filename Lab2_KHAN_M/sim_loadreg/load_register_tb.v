// ECE 5440 
// Author: Mubashar Khan, 2949
// load_register_tb
// This module is used to test the load register
// The program waits for players to press the load button.
//

`timescale 1 ns/100 ps

module load_register_tb();

	reg clk, rst, button;
	reg [3:0]load;

	reg current_state = 2'b00;
	wire [3:0] out_1;

	load_register DUT_load_register(rst, clk, load, button, out_1);

	always begin
		#10 clk = 1;
		#10 clk = 0;
	end
	
	initial begin
	
	@(posedge clk);
	#5 button = 0;
	#5 load = 4'b1001;
	
	@(posedge clk);
	#5 rst = 1;
	@(posedge clk);
	#5 rst = 0;
	@(posedge clk);
	#5 rst = 1;

	@(posedge clk);
	#5 button = 1;
	@(posedge clk);
	#5 button = 0;
	end




endmodule 