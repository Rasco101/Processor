library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY IF_ID_Register IS
  PORT( 
	  clk,rst_temp, stall : IN std_logic;
    
    -- To ID Stage
    -- IN
    IF_Inst: IN std_logic_vector(31 downto 0);
    --OUT
    ID_Inst: OUT std_logic_vector(31 downto 0);

    -- Public
    --IN
    IF_PC: IN std_logic_vector(10 downto 0);
    --OUT
    ID_PC: OUT std_logic_vector(10 downto 0)
  );

END IF_ID_Register;

ARCHITECTURE behavior_IF_ID_Register OF IF_ID_Register IS
component my_nDFF is
  GENERIC ( n : integer :=1);
  PORT( Clk,Rst : IN std_logic;
  d : IN std_logic_vector(n-1 DOWNTO 0);
  stall : in std_logic;
  q : OUT std_logic_vector(n-1 DOWNTO 0));
end component;
      SIGNAL rst: std_logic:='0';
  BEGIN
    IF_ID_Inst: my_nDFF  GENERIC MAP(32) PORT MAP(clk, Rst, IF_Inst, stall, ID_Inst);

    IF_ID_PC: my_nDFF GENERIC MAP(11) PORT MAP(clk, Rst, IF_PC, stall, ID_PC);
    PROCESS (rst_temp, IF_PC) BEGIN
      rst <= '0';
      IF rising_edge(rst_temp) THEN
        rst <= '1';
      END IF;
    END PROCESS;

END behavior_IF_ID_Register;