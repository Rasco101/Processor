LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY MUX41 IS 
	Generic ( n : Integer:=16);
	PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
			sel : IN  std_logic_vector (1 DOWNTO 0);
			out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END MUX41;


ARCHITECTURE behavior_MUX41 OF MUX41 is
BEGIN
  out1 <= 	in0 when sel = "00"
	else	in1 when sel = "01"
	else	in2 when sel = "10"
	else 	in3; 
END behavior_MUX41;