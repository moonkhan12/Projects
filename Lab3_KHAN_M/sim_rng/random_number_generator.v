// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// random_number_generator
// This module generates a random number between 0 and 15
// It uses a counter that increments while the button is pressed to achieve a true random number.
//


module random_number_generator (clock, reset, button, random_number);
	input clock, reset, button;
	output [3:0] random_number;
	assign inverted_button_signal = ~button;

	counter random_number_counter(clock, reset, inverted_button_signal, random_number);

endmodule

