
module beq (A, B, result);
	output [31:0] result;
	input [31:0] A, B;
	wire [31:0] temp1;
	
	assign temp1 = A - B ;
	assign result = temp1 ? 0 : 1;
endmodule