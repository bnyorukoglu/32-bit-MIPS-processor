
module sllv (rs,rt,rd);
	input [31:0] rs;
	input [31:0] rt;
	output [31:0] rd ;
	assign {rd} = rs << rt ;
endmodule