// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// onesecond_timer
// This module controls the time for the digit_timer
// This module increments time by 1 second
// 

module onesecond_timer(reset, clock, enable, second_count);

input clock, reset, enable;
output second_count;

reg [15:0] millisecond_count = 0;
reg second_count = 0;


always @ (posedge clock) begin//count each second
	if (reset == 1'b0) begin
		millisecond_count = 0;
		second_count = 0;
	end 
	else begin
		if (enable == 1'b1) begin
			if (millisecond_count == 16'b1100001101010000) begin //50,000 100 ms timer
				second_count <= 1'b1;
				millisecond_count <= 16'b0;
			end
			else begin
				second_count <= 1'b0;
				millisecond_count <= millisecond_count + 16'b1;
			end
		end
	end
end
endmodule