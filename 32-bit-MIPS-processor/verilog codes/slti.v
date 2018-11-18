
module slti (A, result, B);
		input [31:0] A, B;
		output [31:0] result;
		wire signed [31:0] A, B;	
		wire temp;
		
		assign temp = (A < B);	
		assign result = temp ? A : B;
endmodule