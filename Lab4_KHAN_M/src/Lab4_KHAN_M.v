// ECE 5440
// Author: Mubashar Khan, 2949
// Lab4_KHAN_M
// Top level file for lab 4.
// Password is 2949
//

module Lab4_KHAN_M (reset, clock, password_button, player_button, password, red_LED, green_LED, player_input,seg7_num1, seg7_num2, seg7_sum, tens_time, ones_time, seg7_tens, seg7_ones);

	//lab 4 variables
	wire [15:0] data;
	
	//lab 3 variables
	input [3:0] tens_time, ones_time; //two digit time connections
	wire enable, reconfig, timeout, second_count; // two digit timer connections
	wire [3:0] random_number, sevenseg_display_tens, sevenseg_display_ones;
	output [6:0] seg7_tens, seg7_ones;
	
	
	//lab 2 variables
	input clock, reset, password_button, player_button;
	input [3:0] password;
	output red_LED, green_LED;
	wire random_number_button, player_button_pressed, password_button_pressed, ac_to_random, ac_to_ld_reg;	
	wire [3:0] output_from_ld_reg_p2;

	
	//lab 1 variables
	input [3:0] player_input; 
	output [6:0] seg7_num1, seg7_num2, seg7_sum;	
	wire [3:0] sum;
	

	//lab 4 function calls
	rom_controller rom_controller_instance(reset, password_button_pressed, clock, data);


	//lab 3 function calls
	random_number_generator rng(clock, reset, ac_to_random, random_number);
	
	onesecond_timer second_decrement(reset, clock, enable, second_count);
	two_digit_timer timedisplay(clock, reset, reconfig, tens_time, ones_time, second_count, timeout, sevenseg_display_tens, sevenseg_display_ones);
	
	Seven_Seg tens_display (sevenseg_display_tens, seg7_tens);
	Seven_Seg ones_display (sevenseg_display_ones, seg7_ones);

	//lab 2 function calls
	button_shaper player_button_shaper(reset, clock, player_button, player_button_pressed); 
	button_shaper password_button_shaper(reset, clock, password_button, password_button_pressed); 
	load_register player_load (reset, clock, player_input, ac_to_ld_reg, output_from_ld_reg_p2);
	
	access_controller game_access (reset, clock, random_number_button, player_button_pressed, password, password_button_pressed, ac_to_random, ac_to_ld_reg, red_LED, green_LED, enable, reconfig, timeout, data); 


	
	//lab 1 function calls
	adder adder_1 (random_number, output_from_ld_reg_p2, sum);
 
	Seven_Seg seg7_number1 (ac_to_random, seg7_num1); 
	Seven_Seg seg7_number2 (output_from_ld_reg_p2, seg7_num2);
	Seven_Seg seg7_summation (sum, seg7_sum);

endmodule 
