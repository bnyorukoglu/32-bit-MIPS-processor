//BENGI YORUKOGLU 131044046
module pc(addr , readI, clock);
	output reg [31:0] readI;
	input [31:0] addr;
	input clock;
	reg [31:0] tempPc;
	
	initial tempPc = 0;
	
	always @(addr or tempPc)
		begin
			tempPc = addr;
		end
	
	always @(clock or tempPc)// running the program with this clock
		begin
			readI = tempPc ;
		end
endmodule
