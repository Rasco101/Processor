Library ieee;
use ieee.std_logic_1164.all;

ENTITY MEM_WB_Register IS
    PORT( 
      clk, rst, stall: IN std_logic;

      -- To WB Stage
      --IN
      MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2: IN std_logic_vector(0 downto 0);
      --OUT
      WB_MemToReg, WB_PortIn, WB_PortOut, WB_RegWrt1, WB_RegWrt2: OUT std_logic_vector(0 downto 0);
      
      -------------- Public
      --IN
      MEM_MemOut, MEM_R2, MEM_F: IN std_logic_vector(31 downto 0);
      MEM_Rd, MEM_Rd2: IN std_logic_vector(2 downto 0);
      --OUT
      WB_MemOut, WB_R2, WB_F: OUT std_logic_vector(31 downto 0);
      WB_Rd, WB_Rd2: OUT std_logic_vector(2 downto 0)
    
    );
END MEM_WB_Register;

ARCHITECTURE behavior_MEM_WB_Register OF MEM_WB_Register IS
  component my_nDFF is
    GENERIC ( n : integer :=1);
	  PORT( 
      Clk,Rst : IN std_logic;
      d : IN std_logic_vector(n-1 DOWNTO 0);
      stall : in std_logic;
      q : OUT std_logic_vector(n-1 DOWNTO 0));
  end component;
  begin
    --------------- WB ----------------	
    MEM_WB_MemToReg: my_nDFF PORT MAP(clk, rst, MEM_MemToReg, stall, WB_MemToReg);
    MEM_WB_PortIn: my_nDFF PORT MAP(clk, rst, MEM_PortIn, stall, WB_PortIn);
    MEM_WB_PortOut: my_nDFF PORT MAP(clk, rst, MEM_PortOut, stall, WB_PortOut);
    MEM_WB_RegWrt1: my_nDFF PORT MAP(clk, rst, MEM_RegWrt1, stall, WB_RegWrt1);
    MEM_WB_RegWrt2: my_nDFF PORT MAP(clk, rst, MEM_RegWrt2, stall, WB_RegWrt2);

    --------------- Public ----------------	
    MEM_WB_MemOut: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, MEM_MemOut, stall, WB_MemOut);
    MEM_WB_R2: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, MEM_R2, stall, WB_R2);
    MEM_WB_F: my_nDFF GENERIC MAP(32) PORT MAP(clk, rst, MEM_F, stall, WB_F);

    MEM_WB_Rd: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, MEM_Rd, stall, WB_Rd);
    MEM_WB_Rd2: my_nDFF GENERIC MAP(3) PORT MAP(clk, rst, MEM_Rd2, stall, WB_Rd2);

    

  
END behavior_MEM_WB_Register;