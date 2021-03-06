`timescale 10ns/100ps

module digit_timer_tb ();

	reg clock, reset, set_time_button, decrease_timer, cant_borrow;
	reg [3:0] starting_number;
	wire [3:0] sevenseg_display;
	wire cant_loan, borrow_from_left;

	digit_timer DUT_digit_timer (clock, reset, set_time_button, starting_number, sevenseg_display, cant_loan, borrow_from_left, cant_borrow, decrease_timer);
	

	always begin
		#10 clock = 1;
		#10 clock = 0;
	end
	
	initial begin
		@(posedge clock);
		#5 reset = 1;
		@(posedge clock);
		#5 reset = 0;
		@(posedge clock);
		#5 reset = 1;

		
  		#5 starting_number = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 starting_number = 4'b0101;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 set_time_button = 1;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 set_time_button = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1;
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1; //Time 5
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1;
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1;
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1;
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#5 decrease_timer = 1; //0
		@(posedge clock);
		#5 decrease_timer = 0;
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		
	end

    
endmodule
