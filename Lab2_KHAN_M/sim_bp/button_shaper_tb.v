// ECE 5440 
// Author: Mubashar Khan, 2949
// button_shaper_tb
// This module is a button shaper that emits a pulse for 1 clock cycle when the button is pressed
// This module was created using a two procedure fsm
//


`timescale 10ns/100ps

module button_shaper_tb ();

	reg clk;
	reg reset;
	reg b_in;

	reg current_state = 2'b00;
	wire b_out;

	button_shaper DUT_button_shaper_1 (clk, reset, b_in, b_out);

	always begin
		#10 clk = 1;
		#10 clk = 0;
	end
	
	initial 
		begin

//test 1
		@(posedge clk);
		#5 reset = 1;
		@(posedge clk);
		#5 reset = 0;
		@(posedge clk);
		#5 reset = 1;
		@(posedge clk);
		#5 b_in = 1;
		@(posedge clk);
		#5 b_in = 0;
		@(posedge clk);
		#5 b_in = 0;
		@(posedge clk);
		#5 b_in = 1;

//test 2

		@(posedge clk);
		#5 reset = 0;
		@(posedge clk);
		#5 reset = 1;
		@(posedge clk);
		#5 reset = 0;
		@(posedge clk);
		#5 b_in = 1;
		@(posedge clk);
		#5 b_in = 1;
		@(posedge clk);
		#5 b_in = 0;
		@(posedge clk);
		#5 b_in = 1;
		end
endmodule
