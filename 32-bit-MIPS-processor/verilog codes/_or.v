
module _or (rs, rt, rd);
	input [31:0] rs, rt;
	output [31:0] rd;
	assign {rd} = rs | rt ;
endmodule