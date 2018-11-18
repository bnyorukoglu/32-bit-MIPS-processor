//BENGI YORUKOGLU 131004046
module mips_data_memory (data_read, add, data_write, mem_write);
	output [31:0] data_read; //output of load word
	input mem_write; //signal that allows writing
	input [31:0] add, data_write ;	
	reg [31:0] memory[255:0]; 
	reg [31:0] data_read;
	
	initial begin
		$readmemb(".\\data.mem", memory) ;
	end
	
	always @(add or data_write or data_read)  //If one of these changes
		if (mem_write) 
			memory[add] = data_write;
		else 
			data_read = memory[add];	
endmodule