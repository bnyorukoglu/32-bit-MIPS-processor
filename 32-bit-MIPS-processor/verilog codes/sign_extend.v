//BENGI YORUKOGLU 131044046
module sign_extend(extendedI, extendedJ, immediate, jumpAdress);
	output [31:0] extendedI, extendedJ;
	input [25:0] jumpAdress;
	input [15:0] immediate;
	
	assign extendedI = { {16{immediate[15]}}, immediate[15:0]};//extended version of immediate part
	assign extendedJ = { {6{jumpAdress[25]}}, jumpAdress[25:0]}; //extended version of jump part 

endmodule