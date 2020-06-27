library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity DataMemory is
    PORT(
        clk, rst, en: IN std_logic;
        dataAddress: IN std_logic_vector(10 downto 0);
        dataDataOut: OUT std_logic_vector(31 downto 0);
        dataDataIn: IN std_logic_vector(31 downto 0);
        dataMemWrt: IN std_logic -- Works As Enable in case of stall
    );

END DataMemory;


architecture InstMemort_inp of DataMemory is
    type RAM_TYPE is array (0 to (2**11)-1) of std_logic_vector(15 downto 0);
    Signal RAM: RAM_TYPE;
    SIGNAL next_empty: std_logic_vector(10 downto 0);
    Signal SPAddress: std_logic_vector(10 downto 0);
begin
    PROCESS(clk) 
        VARIABLE next_index: std_logic_vector(10 downto 0);
        VARIABLE index: std_logic_vector(10 downto 0);
    BEGIN
        next_index := next_empty;
        index := SPAddress; 
        if rst= '1' THEN
            dataDataOut <= (others => '0');
            next_empty <= std_logic_vector(to_unsigned((2 ** 11) -1, 11));
            SPAddress <= std_logic_vector(to_unsigned((2 ** 11) -2, 11));
            next_index := std_logic_vector(to_unsigned((2 ** 11) -1, 11));
            index := std_logic_vector(to_unsigned((2 ** 11) -2, 11));
        ELSIF falling_edge(clk) THEN 
            IF dataMemWrt = '1' THEN
                IF en = '1' THEN                   
                    index := next_index - 1;
                    next_index := next_index - 2;
                    RAM(to_integer(unsigned(index))) <= dataDataIn(15 downto 0);
                    RAM(to_integer(unsigned(index))+1) <= dataDataIn(31 downto 16);
                ELSE
                    RAM(to_integer(unsigned(dataAddress))) <= dataDataIn(15 downto 0);
                    RAM(to_integer(unsigned(dataAddress))+1) <= dataDataIn(31 downto 16);
                END IF;
            ELSE    
                IF en = '1' THEN                    
                    IF next_empty = "11111111111" THEN
                        report "Stack Is Empty Cannot use POP";
                    ELSE
                        index := next_index + 1;
                        next_index := next_index + 2;
                    END IF;
                    dataDataOut(15 downto 0) <= RAM(to_integer(unsigned(index)));
                    dataDataOut(31 downto 16) <= RAM(to_integer(unsigned(index + 1)));
                ELSE
                    dataDataOut(15 downto 0) <= RAM(to_integer(unsigned(dataAddress)));
                    dataDataOut(31 downto 16) <= RAM(to_integer(unsigned(dataAddress + 1)));
                END IF;
            END IF;
            SPAddress <= index;
            next_empty <= next_index;
        END IF;
        
    END PROCESS;
end architecture InstMemort_inp;    
