
module lui (result, A);
	input [31:0] A;
	output [31:0] result ;
	wire temp = 0;
	assign result = { A[15:0], {16{temp}}};
endmodule