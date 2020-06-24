library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity TriStateBuffer is
    port (
        TSB_IN: IN std_logic_vector(31 downto 0);
        TSB_OUT: OUT std_logic_vector(31 downto 0);
        TSB_EN: IN std_logic
    );
END TriStateBuffer;

architecture rtl of TriStateBuffer is
    
begin
    
    TSB_OUT <= TSB_IN when TSB_EN = '1' ELSE (others => 'Z');
    
end architecture rtl;