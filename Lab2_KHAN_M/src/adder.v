// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// adder
// This module adds 2 four-bit inputs. We do not care about overflow and the output is also four-bits.
// 

module adder (in1, in2, sum);
	
	input [3:0] in1, in2;
	output [3:0] sum;
	reg [3:0] sum;

	always @ (in1, in2)
		begin
			sum =  in1 + in2;
		end
endmodule


