Library ieee;
use ieee.std_logic_1164.all;

ENTITY FlagsRegister IS
	PORT( 
		clk, rst, stall, SETC, CLRC : IN std_logic;
		ZFin,NFin,CFin : IN std_logic;
		ZFout,NFout,CFout : OUT std_logic);
END FlagsRegister;

ARCHITECTURE behavior_FlagsRegister OF FlagsRegister IS
    
  BEGIN
	PROCESS(clk) BEGIN
		if rst = '1' THEN
			ZFout <= '0';
			NFout <= '0';
			CFout <= '0';
		ELSIF(rising_edge(clk)) THEN
			ZFout <= ZFin;
			NFout <= NFin;
			IF SETC = '1' THEN
				CFout <= '1';
			ELSIF CLRC = '1' THEN 
				CFout <= '0';
			ELSE	
				CFout <= CFin;
			END IF;
		END IF;

	END PROCESS;
    
   
END behavior_FlagsRegister;