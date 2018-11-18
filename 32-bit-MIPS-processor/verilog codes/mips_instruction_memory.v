//BENGI YORUKOGLU 131044046
module mips_instruction_memory( read_index , instruction);
	output reg[31:0] instruction; 
	input [31:0] read_index; 
	reg [31:0] memory [31:0];

	initial begin
		$readmemb(".\\instruction.mem", memory) ;
	end
	
	always @(read_index)
		begin
			instruction = memory[read_index];
		end
endmodule
