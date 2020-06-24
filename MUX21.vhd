LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY MUX21 IS 
	Generic ( n : Integer:=16);
	PORT ( in0,in1 : IN std_logic_vector (n-1 DOWNTO 0);
			sel : IN  std_logic;
			out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END MUX21;


ARCHITECTURE behavior_MUX21 OF MUX21 is
BEGIN
  out1 <= 	in0 when sel = '0'
	else 	in1; 
END behavior_MUX21;