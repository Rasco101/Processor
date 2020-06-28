Library ieee;
use ieee.std_logic_1164.all;

ENTITY PC_Reg IS
	PORT( Clk, Rst, Latch, stall    : IN  std_logic;
	      PCIn   					: IN  std_logic_vector(10 DOWNTO 0);
	      PCOut  					: OUT std_logic_vector(10 DOWNTO 0)
	  );
	  
END PC_Reg;

ARCHITECTURE PC_Reg_Imp OF PC_Reg IS
    
    BEGIN      
	PROCESS(clk, rst, latch, PCIn)
	BEGIN
		IF(rst = '1') THEN
			PCOut <= (others=>'0');
		ELSIF (rising_edge(Clk)) THEN
			if (stall = '0') THEN
				PCOut <= PCIn;
			END IF;
		END IF;
		IF Latch = '1' THEN
			PCOut <= PCIn;
		END IF;
	END PROCESS; 
 end architecture;

   
   
   