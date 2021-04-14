// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// onesecond_timer
// This module controls the time for the digit_timer
// This module increments time by 1 second
// 


`timescale 10ns/100ps

module onesecond_timer_tb();

reg clock, reset;

wire [7:0] second_count;
onesecond_timer DUT_onesecond_timer(reset, clock, second_count);

always begin
	#10 clock = 1;
	#10 clock = 0;
end

initial begin
	reset = 1;	
	#10
	reset = 0;
	#10
	reset = 1;

	@(posedge clock);

end


endmodule
