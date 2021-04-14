`timescale 10ns/ 100ps

module ROM_SIM_tb();

	reg[4:0] addr;
	reg clk;
	wire[15:0] data;

	ROM_1 ROM_1_DUT(addr, clk, data);

	always begin
		clk = 0;
		#5; clk <= 1;
		#5;
	end
	
	initial begin
		addr <= 0;
		#55;
		@(posedge clk); 
		addr <= 1;
		@(posedge clk); 
		addr <= 2;
		@(posedge clk); 
		addr <= 3;
		@(posedge clk); 
		addr <= 4;
		@(posedge clk); 
		addr <= 5;
		@(posedge clk); 
		addr <= 6;
		@(posedge clk); 
		addr <= 7;
		@(posedge clk); 
		addr <= 8;
		@(posedge clk); 
		addr <= 9;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		addr <= 30;
		@(posedge clk);
		addr <= 31;
	end
endmodule

