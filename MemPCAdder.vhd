library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity MemPCAdder is
    port (
        Mem_PC_IN: IN std_logic_vector(10 downto 0);
        Mem_PC_OUT: OUT std_logic_vector(31 downto 0)
    );
end entity MemPCAdder;

architecture MemPCAdder_imp of MemPCAdder is
    
begin
    Mem_PC_OUT(10 downto 0) <= Mem_PC_IN + 2;
    Mem_PC_OUT(31 downto 11) <= (others=>'0');
end architecture MemPCAdder_imp;