// ECE 5440 
// Author: Mubashar Khan, 2949
// access_controller_tb
// This module is used to test access_controller.v
// The test cycles through the 4 states using a incorrect and correct password sequence to test if the module works properly
//


`timescale 1 ns/100 ps

module access_controller_tb ();
	reg [0:0] reset, clock, ld_p1, ld_p2, pass_enter;
	reg [3:0] password;
	wire  [0:0] ld_p1_pst, ld_p2_pst; // 1 on success only
	wire  [0:0] RedLED, GreenLED; //on/off

	access_controller DUT_access_controller (reset, clock, ld_p1, ld_p2, password, pass_enter, ld_p1_pst, ld_p2_pst, RedLED, GreenLED);

	always begin //enable clock
		#10 clock = 1'b1;
		#10 clock = 1'b0;
	end
	
	initial begin //testing
		#5 
		ld_p1 = 1'b1;
		ld_p2 = 1'b1;
		pass_enter = 1'b0;
			

		@(posedge clock);
		reset = 1'b1;
		@(posedge clock);
		reset = 1'b0;
		@(posedge clock);
		reset = 1'b1;

		//password is 2949
		//incorrect input test
			
		

		@(posedge clock);
		#5 password = 4'b0010; // 2
		@(posedge clock); 
		#5 pass_enter = 1'b1;
		@(posedge clock); 
		#5 pass_enter = 1'b0;
		
		@(posedge clock);
		#5 password = 4'b0100; // 4 <-should trigger password_correct_flag
		@(posedge clock); 
		#5 pass_enter = 1'b1;
		@(posedge clock); 
		#5 pass_enter = 1'b0;
		
		@(posedge clock);		
		#5 password = 4'b1000; // 8
		@(posedge clock); 
		#5 pass_enter = 1'b1;
		@(posedge clock); 
		#5 pass_enter = 1'b0;
		
		@(posedge clock);		
		#5 password = 4'b1001; // 9
		@(posedge clock); 
		#5 pass_enter = 1'b1;
		@(posedge clock); 
		#5 pass_enter = 1'b0;
						
		


		//correct input test
		//@(posedge clock);
		//#5 reset = 0;
		@(posedge clock); 
		#5 password = 4'b0010; // 2
		@(posedge clock);
		#5 pass_enter = 1'b1;
		@(posedge clock);
		#5 pass_enter = 1'b0;
		
		@(posedge clock);		
		#5 password = 4'b1001; // 9
		@(posedge clock);
		#5 pass_enter = 1'b1;
		@(posedge clock);
		#5 pass_enter = 1'b0;
		@(posedge clock);

		@(posedge clock);
		#5 password = 4'b0100; // 4
		@(posedge clock);
		#5 pass_enter = 1'b1;
		@(posedge clock);
		#5 pass_enter = 1'b0;
		@(posedge clock);

		@(posedge clock);
		#5 password = 4'b1001; // 9
		@(posedge clock);
		#5 pass_enter = 1'b1;
		@(posedge clock);
		#5 pass_enter = 1'b0;


		// now testing output if inputs are changed while in state 5
		
		

		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#20 
		ld_p1 = 1'b1;
		ld_p2 = 1'b0;

		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#20
		ld_p1 = 1'b0;
		ld_p2 = 1'b0;

		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		#20
		ld_p1 = 1'b1;
		ld_p2 = 1'b1;
		

		//reset everything
		@(posedge clock);
		reset = 0;
		@(posedge clock);
		@(posedge clock);
		reset = 1;
		
	end
endmodule

