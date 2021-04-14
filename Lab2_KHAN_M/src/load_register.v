// ECE 5440 
// Author: Mubashar Khan, 2949
// load_register
// This module is used to prevent inputs from showing up on the displays until the load button has been pressed
// The program waits for players to enter a 4-bit input and press the load button.
// The signal then allows the input to be displayed.
//

module load_register(rst, clk, four_bit_input, button, four_bit_output);

    input [3:0] four_bit_input;
    input rst, clk, button;
    output reg [3:0] four_bit_output;
	
    always @(posedge clk) begin
        if (rst == 1'b0) begin 
            four_bit_output <= 4'b0000;
        end
        else begin
            if (button == 1'b1) begin
                four_bit_output <= four_bit_input;
            end
        end
    end	
endmodule
