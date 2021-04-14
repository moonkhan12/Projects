// ECE 5440 
// Author: Mubashar Khan, 2949
// lfsr_tb
// This module is used to test the lfsr module
// The output should be random 4-bit numbers
//

`timescale 10ns / 100ps

module lfsr_tb();
reg clock;
reg reset;
wire [3:0] randomNumber;


lfsr DUT_lfsr(clock,reset,randomNumber);


always begin
	#5;
	clock = ~ clock;
end

initial begin
	clock = 0;
	reset = 1;
	#15;
    	reset = 0;
    	#100;
end

endmodule
