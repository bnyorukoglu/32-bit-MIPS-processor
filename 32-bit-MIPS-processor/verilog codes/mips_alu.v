//BENGI YORUKOGLU 131044046
module mips_alu (result, CarryOut, funct, shamt, A, B);
		output reg [31:0] result;
		output CarryOut;
		input [31:0] A,B; // Datas from memory
		input [5:0] funct; //funct code of instrucitons
		input [4:0] shamt;
		
		// variables for ternary conditional statements
		//wire [4:0]  var1,  var2,  var3,  var4,  var5,  var6,
		//				var7,  var8,  var9,	var10, var11, var12,  
		//				var13, var14, var15, var16, var17, var18; 
		wire [31:0] result1,  result2,  result3,  result4,  result5,  result6,  
					   result7,  result8,  result9,  result10, result11, result12, 
						result13, result14, result15, result16, result17, result18;		

		//all instruciton functions take result* variables and fill it up	 
		//lw sw and jump instrucitons implemented at mips_core		
		adder AddFunc  (A, B, result1, CarryOut1);
		addi  AddImmFunc  (A, result2, B, CarryOut);
		addiu AddImmUnsignedFunc  (A, result3, B);
		_and  ANDFunc  (A, B, result4);
		andi  ANDImmFunc  (A, result5, B);
		beq   BranchOnEqualFunc  (A, B, result6);
		bne   BranchOnNotEqualFunc  (A, B, result7);
		lui   LoadUpperImmFunc  (result8, B);
		_or   ORFunc  (A, B, result9);
		ori   ORImmFunc  (A, result10, B);
		slt   SetLessThanFunc  (A, B, result11);
		slti  SetLessThanImmFunc  (A, result12, B);
		sltiu SetLessThanImmUnsignedFunc  (A, result13, B);
		sll   ShiftLeftLogicalFunc  (A, shamt, result14);
		sllv  ShiftLeftLogicalVariableFunc  (A, B, result15);
		sra   ShiftRightArithmeticFunc  (A, shamt, result16);
		srl   ShiftRightLogicalFunc  (A, shamt, result17);
		sub   SubtractFunc  (A, B, result18, CarryOut2);

		always @(*)
		begin
			if(funct == 6'b100000 ) //Add instruciton
				begin
					result<=result1;
				end
			if(funct == 6'b001000 )//Add Immediate instruciton
				begin
					result<=result2;
				end
			if(funct == 6'b001001 )//Add Immediate Unsigned instruciton
				begin
					result<=result3;
				end
			if(funct == 6'b100100 )//And instruciton
				begin
					result<=result4;
				end
			if(funct == 6'b001100  )//And Immediate instruciton
				begin
					result<=result5;
				end
			if(funct == 6'b000100 ) //BranchOnEqual instruciton
				begin
					result<=result6;
				end
			if(funct == 6'b000101 ) //BranchOnNotEqual instruciton
				begin
					result<=result7;
				end
			if(funct == 6'b001111 ) //LoadUpperImm instruciton
				begin
					result<=result8;
				end
			if(funct == 6'b100101 )//Or instruciton
				begin
					result<=result9;
				end
			if(funct == 6'b001101 )//Or Immediate instruciton
				begin
					result<=result10;
				end
			if(funct == 6'b101010 )//SetLessThan instruciton
				begin
					result<=result11;
				end
			if(funct == 6'b001010 )//Set Less Than Immediate instruciton
				begin
					result<=result12;
				end
			if(funct == 6'b001011 )//Set Less Than Immediate Unsigned instruciton
				begin
					result<=result13;
				end
			if(funct == 6'b001010 )//Shift Left Logical instruciton
				begin
					result<=result14;
				end
			if(funct == 6'b100 )//Shift Left LogicalVariable instruciton
				begin
					result<=result15;
				end
			if(funct == 6'b11 )//shift right arithmatic instruciton
				begin
					result<=result16;
				end
			if(funct == 6'b10 ) //Shift Right Logical instruciton
				begin
					result<=result17;
				end
			if(funct == 6'b100010 )  //Subtract instruciton
				begin
					result<=result18;
				end
		end
		
		 
endmodule