Library ieee;
use ieee.std_logic_1164.all;

ENTITY EX_MEM_Register IS
	PORT(
		--Reg Signals
		clk, rst, stall: IN std_logic;

		-- To Mem Stage
		--IN
		EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI: IN std_logic_vector(0 downto 0);
		EXC_SP: IN std_logic_vector(1 downto 0);
		--OUT
		MEM_MemWrt, MEM_CALL, MEM_RET, MEM_RTI: OUT std_logic_vector(0 downto 0);
		MEM_SP: OUT std_logic_vector(1 downto 0);
		
		-- To WB Stage
		--IN
		EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2: IN std_logic_vector(0 downto 0);
		--OUT
		MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2: OUT std_logic_vector(0 downto 0);
		
		-------------- Public
		--IN
		EXC_F, EXC_R2: IN std_logic_vector(31 downto 0);
		EXC_Rd, EXC_Rd2: IN std_logic_vector(2 downto 0);
		EXC_EA, EXC_PC: IN std_logic_vector(10 downto 0);
		--OUT
		MEM_F, MEM_R2: OUT std_logic_vector(31 downto 0);
		MEM_Rd, MEM_Rd2: OUT std_logic_vector(2 downto 0);
		MEM_EA, MEM_PC: OUT std_logic_vector(10 downto 0)
	);
	
END EX_MEM_Register;

ARCHITECTURE behavior_EX_MEM_Register OF EX_MEM_Register IS
	component my_nDFF is
		GENERIC ( n : integer :=1);
		PORT( Clk,Rst : IN std_logic;
		d : IN std_logic_vector(n-1 DOWNTO 0);
		stall : in std_logic;
		q : OUT std_logic_vector(n-1 DOWNTO 0));
	end component;
  
  BEGIN
	-------------- MEM ----------------
  	EXE_MEM_MemWrt: my_nDFF PORT MAP(clk, rst, EXC_MemWrt, stall, MEM_MemWrt);
  	EXE_MEM_CALL: my_nDFF PORT MAP(clk, rst, EXC_CALL, stall, MEM_CALL);
  	EXE_MEM_RET: my_nDFF PORT MAP(clk, rst, EXC_RET, stall, MEM_RET);
	EXE_MEM_RTI: my_nDFF PORT MAP(clk, rst, EXC_RTI, stall, MEM_RTI);
	EXE_MEM_SP: my_nDFF GENERIC MAP(2) PORT MAP(clk, rst, EXC_SP, stall, MEM_SP);
	  
	--------------- WB ----------------	
  	EXE_MEM_MemToReg: my_nDFF PORT MAP(clk, rst, EXC_MemToReg, stall, MEM_MemToReg);
  	EXE_MEM_PortIn: my_nDFF PORT MAP(clk, rst, EXC_PortIn, stall, MEM_PortIn);
	EXE_MEM_PortOut: my_nDFF PORT MAP(clk, rst, EXC_PortOut, stall, MEM_PortOut);
	EXE_MEM_RegWrt1: my_nDFF PORT MAP(clk, rst, EXC_RegWrt1, stall, MEM_RegWrt1);
	EXE_MEM_RegWrt2: my_nDFF PORT MAP(clk, rst, EXC_RegWrt2, stall, MEM_RegWrt2);
	  
	--------------- PUBLIC ----------------
  	EXE_MEM_F: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, EXC_F, stall, MEM_F);
  	EXE_MEM_R2: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, EXC_R2, stall, MEM_R2);
  	EXE_MEM_Rd: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, EXC_Rd, stall, MEM_Rd);
  	EXE_MEM_Rd2: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, EXC_Rd2, stall, MEM_Rd2);
  	EXE_MEM_EA: my_nDFF GENERIC MAP(11) PORT MAP(clk, rst, EXC_EA, stall, MEM_EA);
  	EXE_MEM_PC: my_nDFF GENERIC MAP(11) PORT MAP(clk, rst, EXC_PC, stall, MEM_PC);

END behavior_EX_MEM_Register;