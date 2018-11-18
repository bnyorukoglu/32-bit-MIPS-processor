
module addiu (A, result, B);
	input [31:0] A, B;
	output [31:0] result ;
	assign result = A + B ;
endmodule