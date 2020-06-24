library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity DataMemory is
    PORT(
        clk, rst: IN std_logic;
        dataAddress: IN std_logic_vector(10 downto 0);
        dataDataOut: OUT std_logic_vector(31 downto 0);
        dataDataIn: IN std_logic_vector(31 downto 0);
        dataMemWrt: IN std_logic -- Works As Enable in case of stall
    );

END DataMemory;


architecture InstMemort_inp of DataMemory is
    type RAM_TYPE is array (0 to (2**11)-1) of std_logic_vector(15 downto 0);
    Signal RAM: RAM_TYPE;
begin
    PROCESS(clk) 

    BEGIN
        if rst= '1' THEN
            dataDataOut <= (others => '0'); 
        ELSIF rising_edge(clk) THEN
            if (dataMemWrt = '0') THEN
                dataDataOut(15 downto 0) <= RAM(to_integer(unsigned(dataAddress)));
                dataDataOut(31 downto 16) <= RAM(to_integer(unsigned(dataAddress))+1);
            END if;
        ELSIF falling_edge(clk) THEN 
            IF dataMemWrt = '1' THEN
                RAM(to_integer(unsigned(dataAddress))) <= dataDataIn(15 downto 0);
                RAM(to_integer(unsigned(dataAddress))+1) <= dataDataIn(31 downto 16);
            END IF;
        END IF;
    END PROCESS;

end architecture InstMemort_inp;    
