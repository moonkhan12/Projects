

module two_digit_timer (clock, reset, reconfigure, tens_time, ones_time, timer, clockout, sevenseg_display_tens, sevenseg_display_ones);

	input reset, clock, reconfigure, timer;
	input [3:0] tens_time, ones_time;
	
	output [3:0] sevenseg_display_tens, sevenseg_display_ones;
	wire cant_loan, borrow_from_left_tens, borrow_from_left_ones, cant_borrow;
	
	output reg clockout;

	digit_timer ones_digit_timer(clock, reset, set_time_button, ones_time, sevenseg_display_ones, cant_loan, borrow_from_left_ones, clockout, timer);
	digit_timer tens_digit_timer(clock, reset, set_time_button, tens_time, sevenseg_display_tens, cant_borrow, borrow_from_left_tens, cant_loan, borrow_from_left_ones);
	



endmodule

/*
digit timer: Last 4 variables are the I/O
from left to right we have:
digit_timer (clock, reset, ..., bottom left input, top left output, bottom right output, top right input);
		


borrow from left tens     borrow from left ones		timer
					  <---__________	 <---		_________<--- 
							|			|	  			|		  | 
							|	tens	|    			|	ones |
							|			|    			|		  |
							__________    			_________
					  --->			 	 --->					---> 
          cant borrow  			  cant loan				clockout



*/