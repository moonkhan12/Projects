// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// Seven_Seg_tb
// This module is the test bench for the 4-16 decoder
// Its function is to be used to test sample inputs and observe their outputs.
//

`timescale 10ns/100ps

module Seven_Seg_tb ();
	reg[3:0] Seg_in;
	wire[6:0] Seg_out;
	
	Seven_Seg DUTSeven_Seg(Seg_in,Seg_out);

	initial
		begin
			Seg_in = 4'b0000; // 0
			#10;
			Seg_in = 4'b0001; // 1
			#10;
			Seg_in = 4'b0010; // 2
			#10;
			Seg_in = 4'b0011; // 3
			#10;	
			Seg_in = 4'b0100; // 4
			#10;
			Seg_in = 4'b0101; // 5
			#10;
			Seg_in = 4'b0110; // 6
			#10;
			Seg_in = 4'b0111; // 7
			#10;
			Seg_in = 4'b1000; // 8
			#10;
			Seg_in = 4'b1001; // 9
			#10;
			Seg_in = 4'b1010; // A
			#10;
			Seg_in = 4'b1011; // b
			#10;
			Seg_in = 4'b1100; // C
			#10;
			Seg_in = 4'b1101; // d
			#10;
			Seg_in = 4'b1110; // E
			#10;
			Seg_in = 4'b1111; // F
		end
endmodule
