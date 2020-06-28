library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InstMemory is
    PORT(
        clk, rst:IN std_logic;
        instAddress:IN std_logic_vector(10 downto 0);
        instDataOut: OUT std_logic_vector(31 downto 0);
        instMemWrt: IN std_logic -- Works As Enable in case of stall
    );

END InstMemory;


architecture InstMemort_inp of InstMemory is
    type RAM_TYPE is array (0 to (2**11)-1) of std_logic_vector(15 downto 0);
    Signal RAM: RAM_TYPE;
begin
    instDataOut(15 downto 0) <= RAM(to_integer(unsigned(instAddress))) WHEN rst = '0'
        ELSE (others => '0');
    instDataOut(31 downto 16) <= RAM(to_integer(unsigned(instAddress))+1) WHEN rst = '0'
        ELSE (others => '0');
    -- PROCESS(clk, rst) 
    -- BEGIN
    --     IF rst = '1' THEN
    --         instDataOut <= (others => '0');
    --     ELSE
    --         if (instMemWrt = '0') THEN
    --             instDataOut(15 downto 0) <= RAM(to_integer(unsigned(instAddress)));
    --             instDataOut(31 downto 16) <= RAM(to_integer(unsigned(instAddress))+1);
    --         END if;
    --     END IF;	
    -- END PROCESS;

end architecture InstMemort_inp;    