//BENGI YORUKOGLU 131044046
module mips_registers(DataRs, DataRt, memWrite, rs_adress, rt_adress, writeData);
	output wire[31:0] DataRs, DataRt; // content of rs and rt 
	input [4:0] rs_adress, rt_adress; // adress of rs and rt
	input [31:0] writeData;
	input memWrite; 
	reg [31:0] regData [31:0]; 
	
	initial begin
		$readmemb(".\\registers.mem", regData) ;
	end
	
	assign DataRs = regData[rs_adress];
	assign DataRt = regData[rt_adress];

	always @(writeData)
		if(memWrite == 1'b1 )
			begin	
				regData[rt_adress] = writeData;
			end
endmodule