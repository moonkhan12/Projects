// ECE 5440 
// Author: Mubashar Khan, 2949
// access_controller
// This module is used to prevent access to the game until users have entered the correct password
// The program waits for players to enter a 4-digit password that has been predefined.
// The password that players should enter is 2949.
//


module access_controller(reset, clock, random_button, player_input_button, password, pass_enter, output_to_rng, output_to_load_reg, RedLED, GreenLED, enable, reconfig, timeout, rom_data);

	input reset, clock, random_button, player_input_button, pass_enter, timeout;
	input [3:0] password;
	output output_to_rng, output_to_load_reg, RedLED, GreenLED, enable, reconfig;
	input [15:0] rom_data;
	
	
	reg password_correct_flag;
	reg output_to_rng, output_to_load_reg, RedLED, GreenLED, enable, reconfig;
	reg [3:0] state;
	reg [15:0] full_password;

	parameter [3:0] s1_first_digit_check = 4'b0000; 
	parameter [3:0] s2_second_digit_check = 4'b0001;
	parameter [3:0] s3_third_digit_check = 4'b0010; 
	parameter [3:0] s4_fourth_digit_check = 4'b0011; 
	parameter [3:0] s5_success = 4'b0100; // state 4 will also check for successful password entry
	parameter [3:0] s6_reconfig = 4'b0101;
	parameter [3:0] s7_gamestart = 4'b0110;
	parameter [3:0] s8_gameplay = 4'b0111;
	parameter [3:0] s9_gameover = 4'b1000;	
	parameter [3:0] s_wait1 = 4'b1001;
	parameter [3:0] s_wait2 = 4'b1010;
	parameter [3:0] s_passcheck = 4'b1011;

	always @(posedge clock)
 	begin
		//reg [1:0] password_correct_flag;
 		if (reset == 1'b0)
 		begin //reset all output variables to default values, goto state 1
 			state <= s1_first_digit_check;
 			output_to_rng <= 1'b1; //1 because button signal is not inverted yet. button not pushed = 1, pushed = 0
			output_to_load_reg <= 1'b0;
			GreenLED <= 1'b1;
			RedLED <= 1'b1;
			password_correct_flag <= 1'b1; //reset flag

 		end

 		else begin
 			case (state)
				//State 1
 				s1_first_digit_check:begin
					output_to_rng <= 1'b1; // signal for random number generator
					output_to_load_reg <= 1'b0;
					GreenLED <= 1'b0;
					RedLED <= 1'b1;
					password_correct_flag <= 1'b1;
					
					if (pass_enter == 1'b1)
 					begin
						full_password[15:12] <= password;
						state <= s2_second_digit_check; // goto state 2 for second input 
						/*
						if (password == 4'b0010)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s2_second_digit_check; // goto state 2 for second input */
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
						full_password[11:8] <= password;
						state <= s3_third_digit_check; // goto state 2 for second input 
					/*
						if (password == 4'b1001)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s3_third_digit_check; // goto state 3 for third input */
 					end
					else begin
	 					state <= s2_second_digit_check; //repeat s2 until second digit has been entered
					end
 				end
				//State 3

				s3_third_digit_check:begin
					if (pass_enter == 1'b1)
 					begin
						full_password[7:4] <= password;
						state <= s4_fourth_digit_check; // goto state 2 for second input 

					/*
						if (password == 4'b0100)
						begin
							//PW is correct so far, no action needed
						end
						else begin
							password_correct_flag <= 1'b0;
						end
 						state <= s4_fourth_digit_check; // goto state 4 for fourth input */
 					end
					else begin
	 					state <= s3_third_digit_check; //repeat s3 until first digit has been entered
					end
 				end
				//State 4
 		
			s4_fourth_digit_check: begin
					if (pass_enter == 1'b1)
 					begin
						full_password[3:0] <= password;
						state <= s_wait1; // goto wait 2 states
						
						/*
						if (password == 4'b1001)
						begin
						
						
							if(password_correct_flag == 1'b1) //password correct
							begin 
								//output_to_rng <= input_button_press_p1;
								//output_to_load_reg <= player_input_button;
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
						end*/
 					end
					else begin
	 					state <= s4_fourth_digit_check; //repeat s4 until first digit has been entered
					end					
 				end


			s_wait1: begin
					state <= s_wait2;
				end

			s_wait2: begin
					state <= s_passcheck;
				end

			s_passcheck: begin
					if (full_password == rom_data)
					begin
						password_correct_flag <= 1'b1;						
					end
					else begin
						password_correct_flag <= 1'b0;
					end

					if(password_correct_flag == 1'b1) //password correct
						begin 
							//output_to_rng <= input_button_press_p1;
							//output_to_load_reg <= player_input_button;
							RedLED <= 1'b0;
							GreenLED <= 1'b1;
							state <= s5_success; // goto state 5 for infinite success loop			
								
						end 
					else
					begin
 						state <= s1_first_digit_check; // goto state 1 for first input if password is incorrect
					end
				end

				//State 5
			s5_success: begin
					//output_to_rng <= input_button_press_p1; //random number
					//output_to_load_reg <= player_input_button;
					RedLED <= 1'b0;
					GreenLED <= 1'b1;
					state <= s6_reconfig;
				end

			s6_reconfig: begin
					if(pass_enter == 1'b1) begin
						reconfig <= 1'b1;
						state <= s7_gamestart;
					end
					else
						state <= s6_reconfig;
				end

			s7_gamestart: begin
					reconfig <= 1'b0;
					if(pass_enter == 1'b1) begin
						enable <= 1'b1;
						state <= s8_gameplay;
					end
					else
						state <= s7_gamestart;
				end

			s8_gameplay: begin
					output_to_rng <= random_button; //random number
					output_to_load_reg <= player_input_button;
					if (timeout == 1'b1) begin
						state <= s9_gameover;
					end
					else
						state <= s8_gameplay;
				end

			s9_gameover: begin
					enable <= 1'b0;
					RedLED <= 1'b1;
					GreenLED <= 1'b0;
					state <= s9_gameover;
				end
				//default		
				default: begin
 					state <= s1_first_digit_check;
 				end
			endcase
		end
 	end 
endmodule
