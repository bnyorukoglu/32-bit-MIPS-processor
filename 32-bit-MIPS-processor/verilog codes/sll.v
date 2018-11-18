
module sll (rs,Shamt,rd);
	input [31:0] rs;
	input [4:0] Shamt;
	output [31:0] rd ;
	assign {rd} = rs << Shamt ;
endmodule