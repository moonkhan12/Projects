// ECE 5440 
// Author: Mubashar Khan, 2949
// access_controller
// This module is used to prevent access to the game until users have entered the correct password
// The program waits for players to enter a 4-digit password that has been predefined.
// The password that players should enter is 2949.
//


module access_controller(reset, clock, input_button_press_p1, input_button_press_p2, password, pass_enter, ouput_to_load_reg_p1, ouput_to_load_reg_p2, RedLED, GreenLED);

	input reset, clock, input_button_press_p1, input_button_press_p2, pass_enter;
	input [3:0] password;
	output ouput_to_load_reg_p1, ouput_to_load_reg_p2, RedLED, GreenLED;
	
	
	reg password_correct_flag;
	reg ouput_to_load_reg_p1, ouput_to_load_reg_p2, RedLED, GreenLED;
	reg [2:0] state;


	parameter [2:0] s1_first_digit_check = 3'b000; 
	parameter [2:0] s2_second_digit_check = 3'b001;
	parameter [2:0] s3_third_digit_check = 3'b010; 
	parameter [2:0] s4_fourth_digit_check = 3'b011; 
	parameter [2:0] s5_success = 3'b100; // state 4 will also check for successful password entry

	always @(posedge clock)
 	begin
		//reg [1:0] password_correct_flag;
 		if (reset == 1'b0)
 		begin //reset all output variables to default values, goto state 1
 			state <= s1_first_digit_check;
 			ouput_to_load_reg_p1 <= 1'b0; 
			ouput_to_load_reg_p2 <= 1'b0;
			GreenLED <= 1'b1;
			RedLED <= 1'b1;
			password_correct_flag <= 1'b1; //reset flag

 		end

 		else begin
 			case (state)
				//State 1
 				s1_first_digit_check:begin
					ouput_to_load_reg_p1 <= 1'b0;
					ouput_to_load_reg_p2 <= 1'b0;
					GreenLED <= 1'b0;
					RedLED <= 1'b1;
					password_correct_flag <= 1'b1;
					
					if (pass_enter == 1'b1)
 					begin
						if (password == 4'b0010)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s2_second_digit_check; // goto state 2 for second input 
 					end
					else begin
 						state <= s1_first_digit_check; //repeat s1 until first digit has been entered
					end
 				end
				//State 2
 				s2_second_digit_check:begin
					//no change to outputs				
					if (pass_enter == 1'b1)
 					begin
						if (password == 4'b1001)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s3_third_digit_check; // goto state 3 for third input 
 					end
					else begin
	 					state <= s2_second_digit_check; //repeat s2 until second digit has been entered
					end
 				end
				//State 3

				s3_third_digit_check:begin
					if (pass_enter == 1'b1)
 					begin
						if (password == 4'b0100)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s4_fourth_digit_check; // goto state 4 for fourth input 
 					end
					else begin
	 					state <= s3_third_digit_check; //repeat s3 until first digit has been entered
					end
 				end
				//State 4
 		
			s4_fourth_digit_check: begin
					if (pass_enter == 1'b1)
 					begin
						if (password == 4'b1001)
						begin
							if(password_correct_flag == 1'b1) //password correct
							begin 
								ouput_to_load_reg_p1 <= input_button_press_p1;
								ouput_to_load_reg_p2 <= input_button_press_p2;
								RedLED <= 1'b0;
								GreenLED <= 1'b1;
								state <= s5_success; // goto state 5 for infinite success loop			
								
							end
						end
						else begin
							password_correct_flag <= 1'b0;
						end
						if(password_correct_flag == 1'b0) 
						begin
 							state <= s1_first_digit_check; // goto state 1 for first input if password is incorrect
						end
 					end
					else begin
	 					state <= s4_fourth_digit_check; //repeat s4 until first digit has been entered
					end					
 				end
				//State 5
			s5_success: begin
					ouput_to_load_reg_p1 <= input_button_press_p1;
					ouput_to_load_reg_p2 <= input_button_press_p2;
					RedLED <= 1'b0;
					GreenLED <= 1'b1;
					state <= s5_success;
				end
				//default		
				default: begin
 					state <= s1_first_digit_check;
 				end
			endcase
		end
 	end 
endmodule
