// ECE 5440
// Author: Mubashar Khan, 2949
// Lab2_KHAN_M
// Top level file for lab 2.
// 

module Lab2_KHAN_M (reset, clock, password_button, player1_button, player2_button, password, red_LED, green_LED, p1_four_bit_input, p2_four_bit_input,seg7_num1, seg7_num2, seg7_sum);

	//lab 2 variables
	input clock, reset, password_button, player1_button, player2_button;
	input [3:0] password;
	
	output red_LED, green_LED;
	
	wire player1_button_pressed, player2_button_pressed, password_button_pressed, ac_to_ld_reg_p1, ac_to_ld_reg_p2;	
	wire [3:0] output_from_ld_reg_p1, output_from_ld_reg_p2;


	
	//lab 1 variables
	input [3:0] p1_four_bit_input, p2_four_bit_input; 
	output [6:0] seg7_num1, seg7_num2, seg7_sum;	
	wire [3:0] sum;
	


	button_shaper player1_button_shaper(reset, clock, player1_button, player1_button_pressed); 
	button_shaper player2_button_shaper(reset, clock, player2_button, player2_button_pressed); 
	button_shaper password_button_shaper(reset, clock, password_button, password_button_pressed); 
	
	access_controller game_access (reset, clock, player1_button_pressed, player2_button_pressed, password, password_button_pressed, ac_to_ld_reg_p1, ac_to_ld_reg_p2, red_LED, green_LED); 
	
	load_register player1_load (reset, clock, p1_four_bit_input, ac_to_ld_reg_p1, output_from_ld_reg_p1); 
	load_register player2_load (reset, clock, p2_four_bit_input, ac_to_ld_reg_p2, output_from_ld_reg_p2);

	
	//lab 1 function calls, all are working correctly
	adder adder_1 (output_from_ld_reg_p1, output_from_ld_reg_p2, sum);
 
	Seven_Seg seg7_number1 (output_from_ld_reg_p1, seg7_num1); //the value sent to the 7 segment display is from 
	Seven_Seg seg7_number2 (output_from_ld_reg_p2, seg7_num2);
	Seven_Seg seg7_summation (sum, seg7_sum);

endmodule 

