
module digit_timer (clock, reset, set_time_button, starting_number, sevenseg_display, cant_loan, borrow_from_left, cant_borrow, decrease_timer);

input clock, reset, set_time_button, cant_borrow, decrease_timer;
input [3:0] starting_number;

reg cant_borrow_var;
reg [3:0] digit_count = 4'b0000;
output reg [3:0] sevenseg_display;
output reg cant_loan = 1'b0, borrow_from_left = 1'b0;

always @ (set_time_button, decrease_timer) begin //when button is pressed, or when a second has passed do stuff
	if (reset == 1'b0) begin //clear display
		sevenseg_display <= 4'b0000;
		cant_loan <= 1'b0;
		borrow_from_left <= 1'b0;
		cant_borrow_var <= cant_borrow;
	end	
	else begin
		if (set_time_button == 1'b1) begin
			if(starting_number > 4'b1001) //if starting number is > 9, set timer value to 9.
				digit_count <= 4'b1001;
			else
				digit_count <= starting_number;
		end

		if(cant_borrow_var != 0) //for the leftmost timer
			cant_borrow_var <= 1;

		if(digit_count == 4'b0001) begin
			if( cant_borrow_var == 1'b1) begin
				//digit_count <= 4'b0000; //decrement to 0
				cant_loan <= 1'b1; // send signal to right to let it know this one is now 0 and can't loan
			end
			//else
				//digit_count <= digit_count - 4'b0001;
		end
		
		if(digit_count == 4'b0000) begin
			if( cant_borrow_var == 1'b0) begin//look to see if the digit to the left can be borrowed from
				borrow_from_left <= 1'b1; //send a signal to let the left know to decrement
				digit_count <= 4'b1001;

			end
			else //if there is nothing to borrow, then we are out of time
				cant_loan <= 1'b1;
		end
		else begin
			if(decrease_timer == 1'b1) //to ensure that the digit timer only decrements when the signal is set to 1 and not when it is changed back to 0
				digit_count <= digit_count - 4'b0001;
		end
		
	end
	sevenseg_display <= digit_count;
	borrow_from_left <= 1'b0;
end

always @(posedge clock) begin // keep the value up to date

	
end


endmodule

