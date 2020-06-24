LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ZeroExtend1632 IS 
	PORT (original : IN std_logic_vector (15 DOWNTO 0);
			extended : OUT std_logic_vector (31 DOWNTO 0));
END ZeroExtend1632;


ARCHITECTURE behavior_ZeroExtend1632 OF ZeroExtend1632 is
BEGIN
  extended <= "0000000000000000" & original(15 downto 0);
END behavior_ZeroExtend1632;