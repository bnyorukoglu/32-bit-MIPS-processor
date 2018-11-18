
module ori (A, result, B);
	output [31:0] result ;
	input [31:0] A, B;
	assign {result} = A | B ;
endmodule