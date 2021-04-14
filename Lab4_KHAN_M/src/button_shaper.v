// ECE 5440 
// Author: Mubashar Khan, 2949
// button_shaper
// This module is a button shaper that emits a pulse for 1 clock cycle when the button is pressed
// This module was created using a two procedure fsm
//



module button_shaper(reset, clk, button_shaper_input, button_shaper_output);

	input clk, reset, button_shaper_input;
	output reg button_shaper_output;

	reg [1:0] current_state;
	reg [1:0] next_state;

	parameter [1:0] init_state = 2'b00;
	parameter [1:0] pulse_state = 2'b01;
	parameter [1:0] wait_state = 2'b10;

	always @ (current_state, button_shaper_input) 
		begin
			case(current_state)
				init_state:
					begin
						button_shaper_output <= 1'b0;
						if (button_shaper_input == 1'b0)
							next_state <= pulse_state;
						else
							next_state <= init_state;
					end
				pulse_state: 
					begin
						button_shaper_output <= 1'b1;
						next_state <= wait_state;
					end
				wait_state: 
					begin
						button_shaper_output <= 1'b0;
						if (button_shaper_input == 1'b1)
							next_state <= init_state;
						else
							next_state <= wait_state;
					end
				default:
					begin
						button_shaper_output <= 1'b0;
						next_state <= init_state;
					end 
			endcase
		end
	always @(posedge clk)
		begin
			if (reset == 1'b0)
				current_state <= init_state;
			else
				current_state <= next_state;
		end
endmodule
