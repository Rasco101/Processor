Library ieee;
use ieee.std_logic_1164.all;

ENTITY ID_EX_Register IS
	PORT(
		--Reg Signals
		clk, rst, stall: IN std_logic;

		--To Exec Stage
		--IN
		ID_ALUEn, ID_ALUSrc, ID_ALUSrcLDM, ID_SETC, ID_CLRC: IN std_logic_vector(0 downto 0);
		--OUT
		EXC_ALUEn, EXC_ALUSrc, EXC_ALUSrcLDM, EXC_SETC, EXC_CLRC: OUT std_logic_vector(0 downto 0);
		
		-- To Mem Stage
		--IN
		ID_MemWrt, ID_CALL, ID_RET, ID_RTI: IN std_logic_vector(0 downto 0);
		ID_SP: IN std_logic_vector(1 downto 0);
		--OUT
		EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI: OUT std_logic_vector(0 downto 0);
		EXC_SP: OUT std_logic_vector(1 downto 0);
		
		-- To WB Stage
		--IN
		ID_MemToReg, ID_PortIn, ID_PortOut, ID_RegWrt1, ID_RegWrt2: IN std_logic_vector(0 downto 0);
		--OUT
		EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2: OUT std_logic_vector(0 downto 0);
		
		-------------- Public
		--IN
		ID_R1, ID_R2, ID_Imm: IN std_logic_vector(31 downto 0);
		ID_Rs, ID_Rt, ID_Rd, ID_Rd2: IN std_logic_vector(2 downto 0);
		ID_EA, ID_PC: IN std_logic_vector(10 downto 0);
		ID_Func: IN std_logic_vector(3 downto 0);
		--OUT
		EXC_R1, EXC_R2, EXC_Imm: OUT std_logic_vector(31 downto 0);
		EXC_Rs, EXC_Rt, EXC_Rd, EXC_Rd2: OUT std_logic_vector(2 downto 0);
		EXC_EA, EXC_PC: OUT std_logic_vector(10 downto 0);
		EXC_Func: OUT std_logic_vector(3 downto 0)
	);
END ID_EX_Register;

ARCHITECTURE behavior_ID_EX_Register OF ID_EX_Register IS
  component my_nDFF is
	GENERIC(n: INTEGER:=1);
	  PORT( Clk,Rst : IN std_logic;
	  d : IN std_logic_vector(n-1 DOWNTO 0);
	  stall : in std_logic;
	  q : OUT std_logic_vector(n-1 DOWNTO 0));
  end component;
  
  
  BEGIN
    --------------- EXEC ----------------
    ID_EXC_ALUEn: my_nDFF PORT MAP(clk, rst, ID_ALUEn, stall, EXC_ALUEn);
    ID_EXC_ALISrc: my_nDFF PORT MAP(clk, rst, ID_ALUSrc, stall, EXC_ALUSrc);
    ID_EXC_SETC: my_nDFF PORT MAP(clk, rst, ID_SETC, stall, EXC_SETC);
    ID_EXC_CLRC: my_nDFF PORT MAP(clk, rst, ID_CLRC, stall, EXC_CLRC);
	ID_EXC_ALISrcLDM: my_nDFF PORT MAP(clk, rst, ID_ALUSrcLDM, stall, EXC_ALUSrcLDM);
	
	--------------- MEM ----------------
    ID_EXC_MemWrt: my_nDFF PORT MAP(clk, rst, ID_MemWrt, stall, EXC_MemWrt);
    ID_EXC_CALL: my_nDFF PORT MAP(clk, rst, ID_CALL, stall, EXC_CALL);
    ID_EXC_RET: my_nDFF PORT MAP(clk, rst, ID_RET, stall, EXC_RET);
    ID_EXC_RTI: my_nDFF PORT MAP(clk, rst, ID_RTI, stall, EXC_RTI);
	ID_EXC_SP: my_nDFF GENERIC MAP(2) PORT MAP(clk, rst, ID_SP, stall, EXC_SP);
	
	--------------- WB ----------------
    ID_EXC_MemToReg: my_nDFF PORT MAP(clk, rst, ID_MemToReg, stall, EXC_MemToReg);
    ID_EXC_PortIn: my_nDFF PORT MAP(clk, rst, ID_PortIn, stall, EXC_PortIn);
	ID_EXC_PortOut: my_nDFF PORT MAP(clk, rst, ID_PortOut, stall, EXC_PortOut);
	ID_EXC_RegWrt1: my_nDFF PORT MAP(clk, rst, ID_RegWrt1, stall, EXC_RegWrt1);
	ID_EXC_regWrt2: my_nDFF PORT MAP(clk, rst, ID_regWrt2, stall, EXC_regWrt2);
	
	--------------- PUBLIC ----------------
    ID_EXC_R1: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, ID_R1, stall, EXC_R1);
    ID_EXC_R2: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, ID_R2, stall, EXC_R2);
    ID_EXC_Imm: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, ID_Imm, stall, EXC_Imm);
	
	ID_EXC_Rs: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, ID_Rs, stall, EXC_Rs);
    ID_EXC_Rt: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, ID_Rt, stall, EXC_Rt);
    ID_EXC_Rd: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, ID_Rd, stall, EXC_Rd);
    ID_EXC_Rd2: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, ID_Rd2, stall, EXC_Rd2);
	
	ID_EXC_EA: my_nDFF GENERIC MAP(11) PORT MAP(clk, rst, ID_EA, stall, EXC_EA);
    ID_EXC_PC: my_nDFF GENERIC MAP(11) PORT MAP(clk, rst, ID_PC, stall, EXC_PC);
	
	ID_EXC_func: my_nDFF GENERIC MAP(4) PORT MAP(clk, rst, ID_func, stall, EXC_func);
    
    
    
END behavior_ID_EX_Register;