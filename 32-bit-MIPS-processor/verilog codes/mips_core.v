//BENGI YORUKOGLU 1311044046
module mips_core(clock);
	input clock;
	reg writeEnable, memWrite;  // writeEnable = if instruction not sw, its equal to 1
	wire carryOut ;
	wire [4:0] rs, rt, rd, shamt;  //content of instruction of some parts
	wire [5:0] funct; //content of instruction of funct parts
	wire [5:0] opCode;  //content of instruction of opCode parts
	wire [5:0] store_and_load_ll ; // op-temp for lw and sw 
	reg [5:0] temp;
	wire [15:0] immediate;//immediate parts of I type instructions
	wire [25:0] jumpAdress;  // jumpAdress parts of J type instructions
	wire [31:0] PC;  // program counter
	wire [31:0] instruction;	// instruction that taken instruction memory
	wire [31:0] register1, register2;//variables that taken from memory (content of rs and rt)
	wire [31:0] extImm , extJump; //extended version of immediate part
	wire [31:0] var1, var2, var3; // variables for branch instruction
	wire  [31:0] readData; 
	reg  [31:0]writeData;
	wire [31:0] readI; // result of program counter module
	wire [31:0] result;
	wire [31:0] temp4;
		
	//resolution by instruction
	assign	opCode=instruction[31:26];
	assign	rs= instruction[25:21];
	assign	rt= instruction[20:16];
	assign	rd= instruction[15:11];
	assign	shamt= instruction[10:6];
	assign	funct= instruction[5:0];
	assign	immediate= instruction[15:0];
	assign	jumpAdress=instruction[25:0];
		
	// if instruction lw or sw, its using
	assign store_and_load_ll = 6'b001001; 
	sign_extend singEx(extImm, extJump, immediate, jumpAdress );
	always @(* )
	
	begin
		// if sw,sb,sh memWrite 1
		if(opCode==6'b101011 | opCode==6'b101001 | opCode==6'b101000 )
			begin
				 memWrite<=1;
			end
		else// if not (sw,sb,sh) memWrite 0
			begin
				memWrite<=0;
			end

		if(opCode==6'b101011 | opCode == 6'b000010 | opCode == 6'b000100 | opCode == 6'b000101 | 
		   opCode==6'b101011 | opCode == 6'b101001 | opCode==6'b101000 )
			begin
				writeEnable<=0;
			end
		else
			begin
				writeEnable<=1;
			end
			
		if(opCode == 6'b100011 | opCode == 6'b100100  |opCode == 6'b100101 |opCode == 6'b110000)
			begin
				writeData<=readData;
			end
		else
			begin
				writeData<=result;	
			end
			
		if(opCode == 6'b100011 | opCode == 6'b101011 | opCode==6'b110000)	
			begin
				temp<=store_and_load_ll;
			end
			
		if(opCode==6'b000000)
				begin
					temp<=funct;
				end
		else
			begin
				temp<=opCode;
			end
	end
	
	mips_registers registers(register1, register2, writeEnable, rs, rt, writeData); // taking reg1 and reg2 from memory	
	
	assign var1 = (opCode == 6'b000100 ) ? register2 : ((opCode == 6'b000101 ) ? register2 : (opCode == 6'b0 ) ? register2 : extImm) ;
	
	mips_alu aluModule(result, carryOut, temp, shamt, register1, var1);
	mips_data_memory data_mem(readData, result, register2, memWrite); 
	
	assign var2 = readI + 1;// adding 1 because of using array
	assign var3 = var2 + extImm; 
	assign temp4 = var2 + extJump; // jump
   //choosing PC whether to instruction branch or not
	assign PC = (opCode == 6'b000100 ) ? (result ? var3 : var2 ):((opCode == 6'b000101 ) ? (result ? var3 : var2 ):(opCode == 6'b000010) ? temp4 : var2 );
	
	pc PCreg(PC , readI, clock);
	mips_instruction_memory Instruction( readI , instruction);

endmodule