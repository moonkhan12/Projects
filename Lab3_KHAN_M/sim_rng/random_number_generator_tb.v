// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// random_number_generator_tb
// This module generates a random number between 0 and 15
// It uses a counter that increments while the button is pressed to achieve a true random number.
// The button press is simulated by using a random number posedge clocks as a delay


`timescale 10ns/100ps

module random_number_generator_tb ();

	reg clock, reset, button;

	wire random_number;

	random_number_generator DUT_random_number_generator (clock, reset, button, random_number);
	


	always begin
		#10 clock = 1;
		#10 clock = 0;
	end
	
	initial begin
		@(posedge clock);
		#5 reset = 1;
		@(posedge clock);
		#5 reset = 0;
		@(posedge clock);
		#5 reset = 1;
//20
		@(posedge clock);
		@(posedge clock);
		#5 button = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 button = 1;

		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);


//27
		#5 button = 0;
		@(posedge clock);
		@(posedge clock);	
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);

	end 

endmodule 