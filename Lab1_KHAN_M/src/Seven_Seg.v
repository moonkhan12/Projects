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
			4'b0000 : begin Seg_out = 7'b1000000; end //0 //7'b1000000; end 7'b0000001; end 
			4'b0001 : begin Seg_out = 7'b1111001; end //1 //7'b1111001; end 7'b1001111; end 
			4'b0010 : begin Seg_out = 7'b0100100; end //2 //7'b0100100; end 7'b0010010; end 
			4'b0011 : begin Seg_out = 7'b0110000; end //3 //7'b0110000; end 7'b0000110; end
			4'b0100 : begin Seg_out = 7'b0011001; end //4 //7'b0011001; end 7'b1001100; end
			4'b0101 : begin Seg_out = 7'b0010010; end //5 //7'b0010010; end 7'b0100100; end
			4'b0110 : begin Seg_out = 7'b0000010; end //6 //7'b0000010; end 7'b0100000; end
			4'b0111 : begin Seg_out = 7'b1111000; end //7 //7'b1111000; end 7'b0001111; end 
			4'b1000 : begin Seg_out = 7'b0000000; end //8 //7'b0000000; end 7'b0000000; end 
			4'b1001 : begin Seg_out = 7'b0011000; end //9 //7'b0011000; end 7'b0001100; end 
			4'b1010 : begin Seg_out = 7'b0001000; end //A //7'b0001000; end 7'b0001000; end 
			4'b1011 : begin Seg_out = 7'b0000011; end //b //7'b0000011; end 7'b1100000; end 
			4'b1100 : begin Seg_out = 7'b1000110; end //C //7'b1000110; end 7'b0110001; end 
			4'b1101 : begin Seg_out = 7'b0100001; end //d //7'b0100001; end 7'b1000010; end 
			4'b1110 : begin Seg_out = 7'b0000110; end //E //7'b0000110; end 7'b0110000; end 
			4'b1111 : begin Seg_out = 7'b0001110; end //F //7'b0001110; end 7'b0111000; end
			default : begin Seg_out = 7'b1000000; end //0 //7'b1000000; end 7'b0000001; end 
		endcase
	end

endmodule
