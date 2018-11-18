
module sub (rs,rt,rd,CarryOut);
	input [31:0] rs,rt;
	output [31:0] rd ;
	output CarryOut;
	assign {CarryOut,rd} = rs - rt ;
endmodule