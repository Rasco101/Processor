Library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
  port(InstructionOpcode : in std_logic_vector(4 downto 0);
  SPcontrol : out std_logic_vector(1 downto 0);
  RegDst1, RegDst2, ALUSrc, MemtoReg, RegWrite1, RegWrite2, ALUsrcLDM, MemWrite, BranchEqual,
  BranchNegative, BranchCarry, Branch, ALUEn,
  OUTsignal, INsignal, RETsignal, RTIsignal, CALLsignal, SETC, CLRC: out std_logic
  );
end ControlUnit;

architecture behavior_ControlUnit of ControlUnit is
  begin
  
	ALUEn <= '1' when InstructionOpcode = "00001" or InstructionOpcode = "00010"
	or InstructionOpcode = "00011" or InstructionOpcode = "00100" 
	else '0';
      
    RegDst1 <= '1' when InstructionOpcode = "00001" or InstructionOpcode = "00110"
    or InstructionOpcode = "01000" or InstructionOpcode = "01010"
    or InstructionOpcode = "01011" or InstructionOpcode = "01100"
    or InstructionOpcode = "01101" or InstructionOpcode = "01110"
    or InstructionOpcode = "01111" or InstructionOpcode = "10000"
	or InstructionOpcode = "00100" else '0';
    
	SETC <= '1' WHEN InstructionOpcode = "10100" ELSE '0';
	
	CLRC <= '1' WHEN InstructionOpcode = "10101" ELSE '0';
	
    RegDst2 <= '1' when InstructionOpcode = "00101"
    else '0';
    
    ALUSrc <= '1' when InstructionOpcode = "00011" or InstructionOpcode = "00100"
    else '0';
    
    MemtoReg <= '1' when InstructionOpcode = "01001" or InstructionOpcode = "01011"
    else '0';
          
    RegWrite1 <= '1' when InstructionOpcode = "00101" or InstructionOpcode = "00111"
    or InstructionOpcode = "01010" or InstructionOpcode = "01011"
	or InstructionOpcode = "00010" or InstructionOpcode = "00011" 
  or InstructionOpcode = "00100" or InstructionOpcode = "00001"
  OR InstructionOpcode = "01001" else '0';
      
    RegWrite2 <= '1' when InstructionOpcode = "00101"
    else '0';
      
    MemWrite <= '1' when InstructionOpcode = "01100" or InstructionOpcode = "10001"
	or InstructionOpcode = "01000"   else '0';
      
    BranchEqual <= '1' when InstructionOpcode = "01101"
    else '0';
      
    BranchNegative <= '1' when InstructionOpcode = "01110"
    else '0';
      
    BranchCarry <= '1' when InstructionOpcode = "01111"
    else '0';
      
    Branch <= '1' when InstructionOpcode = "10000"
    else '0';
      
    OUTsignal <= '1' when InstructionOpcode = "00110"
    else '0';
    
    INsignal <= '1' when InstructionOpcode = "00111"
    else '0';
      
    SPcontrol <= "01" when InstructionOpcode = "01000" or InstructionOpcode = "10001"
    else "11" when InstructionOpcode = "01001" or InstructionOpcode = "10010"
    or InstructionOpcode = "10011"
    else "00";
      
    ALUsrcLDM <= '1' when InstructionOpcode = "01010"
    else '0';
      
    CALLsignal <= '1' when InstructionOpcode = "10001"
    else '0';
      
    RETsignal <= '1' when InstructionOpcode = "10010"
    else '0';
      
    RTIsignal <= '1' when InstructionOpcode = "10011"
    else '0';
end behavior_ControlUnit;
