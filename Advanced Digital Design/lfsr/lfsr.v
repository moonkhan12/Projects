// ECE 5440 
// Author: Mubashar Khan, 2949
// lfsr_tb
// This module greates a random number by using linear feedback shift registers.
// The output should be random 4-bit numbers
//

module lfsr(clock, reset, randomNumber);

	input clock, reset;
	output reg [3:0] randomNumber;

	wire feedback;

  	assign feedback = ~(randomNumber[3] ^ randomNumber[2]);

	always @(posedge clock, posedge reset)
	begin
    		if (reset)
      			randomNumber = 4'b0;
    		else
      			randomNumber = {randomNumber[2:0],feedback};
  		end
endmodule
