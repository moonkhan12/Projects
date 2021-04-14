// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// counter
// This module is the code 4-bit counter
// It simply adds one to the count at every posedge clock (loops at 15 because output is 4-bit)
//

module counter (clock, reset, button, random_number);

	input clock, reset, button;
	output reg [3:0] random_number;

	always @(posedge clock) begin
		if(reset == 1'b0)
			random_number <= 4'b0000;
		else 
			if(button == 1'b1)
				random_number <= random_number + 4'b0001;
	end
endmodule
