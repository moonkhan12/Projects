// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// Lab1_KHAN_M
// This module is the top code that calls all necessary functions
// Its function is to take thhe 4 bit input from players and pass those values to the adder and decoder functions.
// The returned value from the adder function is also passed to a decoder and all 3 decoder values are used to enable the proper pins on the 7-segment display.
//

module Lab1_KHAN_M (
	//inputs
	switch_num1, switch_num2,
	//outputs
	seg7_num1, seg7_num2, seg7_sum);

	input [3:0] switch_num1, switch_num2;
	output [6:0] seg7_num1, seg7_num2, seg7_sum;
	
	wire [3:0] sum;

	adder adder_1 (switch_num1, switch_num2, sum);

	Seven_Seg seg7_number1 (switch_num1, seg7_num1);
	Seven_Seg seg7_number2 (switch_num2, seg7_num2);
	Seven_Seg seg7_summation (sum, seg7_sum);
endmodule
