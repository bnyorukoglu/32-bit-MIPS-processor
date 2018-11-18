
module  bne (A,B,result);
	input [31:0] A, B;
	output [31:0] result;	
	wire [31:0] temp1;
	
	assign temp1 = A - B ;
	assign result = temp1 ? 1 : 0;	
endmodule