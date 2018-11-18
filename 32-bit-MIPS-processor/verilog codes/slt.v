
module slt (rs, rt, rd);
	output [31:0] rd ;
	input [31:0] rs,rt;
	wire [31:0] temp;
	wire temp1;
	
	assign temp = rt - rs ;
	assign temp1 = (rs[31] == rt[31] && temp[31] != rs[31]) ? 1 : 0;
	assign rd = temp1 ? rt : rs;
endmodule