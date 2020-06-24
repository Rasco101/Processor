Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY PC_Adder IS
    port(
         PCAdderIn  : IN  std_logic_vector(10 downto 0);
         PCAdderOut : OUT std_logic_vector(10 downto 0)
         );
         
END ENTITY;

ARCHITECTURE PC_Add OF PC_Adder IS        

BEGIN 
  PCAdderOut <= PCAdderIn + "0000000010";
  
END ARCHITECTURE; 
