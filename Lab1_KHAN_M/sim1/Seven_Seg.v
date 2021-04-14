// ECE 5440/6370
// Author: Mubashar Khan, 2949 
// Seven_Seg
// This module is the code for the 4-16 decoder. 
// Its function is to take a 4-bit input and convert it to a 7-segment number that can be displayed on a 7-segment display
//

module Seven_Seg (Seg_in, Seg_out);

	input [3:0] Seg_in;
	output [6:0] Seg_out;
	reg [6:0] Seg_out;

	always @ (Seg_in) 
	begin
		case(Seg_in)
			4'b0000 : begin Seg_out = 7'b0000001; end //0
			4'b0001 : begin Seg_out = 7'b1001111; end //1
			4'b0010 : begin Seg_out = 7'b0010010; end //2
			4'b0011 : begin Seg_out = 7'b0000110; end //3
			4'b0100 : begin Seg_out = 7'b1001100; end //4
			4'b0101 : begin Seg_out = 7'b0100100; end //5
			4'b0110 : begin Seg_out = 7'b0100000; end //6
			4'b0111 : begin Seg_out = 7'b0001111; end //7
			4'b1000 : begin Seg_out = 7'b0000000; end //8
			4'b1001 : begin Seg_out = 7'b0001100; end //9
			4'b1010 : begin Seg_out = 7'b0001000; end //A
			4'b1011 : begin Seg_out = 7'b1100000; end //b
			4'b1100 : begin Seg_out = 7'b0110001; end //C
			4'b1101 : begin Seg_out = 7'b1000010; end //d
			4'b1110 : begin Seg_out = 7'b0110000; end //E
			4'b1111 : begin Seg_out = 7'b0111000; end //F
			default : begin Seg_out = 7'b0000001; end //0
		endcase
	end

endmodule
