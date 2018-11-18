
module addi(A, result, B, CarryOut);
	output[31:0] result;
	output CarryOut;
	input [31:0] A, B;
	wire signed [31:0] A ,B;

	assign {CarryOut,result} = A + B ;
endmodule	