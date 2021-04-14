// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// adder_tb
// This module is the test bench for the adder 
// Its function is to be used to test sample inputs and observe their outputs.
//

`timescale 10ns/100ps

module adder_tb ();

	reg [3:0] in1, in2;
	wire [3:0] out1;

	adder DUT_adder(in1, in2, out1);

	initial
		begin
			in1 = 4'b1001;
			in2 = 4'b0110;
			#10;
			in1 = 4'b0011;
			in2 = 4'b1111;
		end
endmodule
