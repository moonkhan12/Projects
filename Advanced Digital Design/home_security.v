/*
module home_security(system_armed, door, window, alarm);
	input system_armed, door, window;
	output reg alarm;

	always @(door, window)
	begin
		if(system_armed == 1'b1)
		begin
			if(door == 1'b0)
				alarm = 1'b1;
			else if (window == 1'b0)
				alarm = 1'b1;
			else
				alarm = 1'b0;
		end
		else
			alarm = 1'b0;
	end
endmodule
*/

module home_security(reset, password, button_pressed, LED, system_armed);
	input [3:0] password; 
	input reset, button_pressed;// 1 if pressed
	
	output reg LED, system_armed;

	reg [1:0] state;

	parameter [1:0] armed = 2'b00,pass_check = 2'b01, disarmed = 2'b10;
	//parameter [1:0] ;
	//parameter [1:0] disarmed = 2'b10;

	always @(button_pressed, reset) begin
		if(reset == 1'b1) begin
			LED <= 1'b1;
			system_armed <= 1'b1;
			state <= armed;
		end
		else
			case(state)
				armed:begin
					LED <= 1'b1;
					system_armed <= 1'b1;
					if(button_pressed == 1'b1)
						state <= pass_check;
					else
						state <= armed;
				end
				pass_check:begin
					if(password == 4'b0111)
						state <= disarmed;
					else
						state <= armed;
				end
				disarmed:begin
					LED <= 1'b0;
					system_armed <= 1'b0;
					if(button_pressed == 1'b1)
						state <= pass_check;
					else
						state <= disarmed;
				end
				default:begin
					state <= armed;
				end
			endcase

	end	

endmodule
