
module sltiu (A,result,B);
	output [31:0] result;
	input  [31:0] A,B;
	wire [31:0] temp;
	wire temp1;
	
	assign temp = B - A ;
	assign temp1 = (A[31] == B[31] && temp[31] != A[31]) ? 1 : 0;
	assign result = temp1 ? B	: A;
endmodule