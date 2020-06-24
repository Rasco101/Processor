library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_file is
  port (
    clk, rst, regWrt1, regWrt2: IN std_logic;
    R1, R2, Rdest1, Rdest2: IN std_logic_vector(2 downto 0);
    DWrite1, DWrite2:   IN std_logic_vector(31 downto 0) ;
    OutR1, OutR2:   OUT std_logic_vector(31 downto 0) 
  ) ;
end reg_file;


architecture reg_file_imp of reg_file is

    type reg_file_array IS array(0 to 7) of std_logic_vector(31 downto 0) ;
    Signal rData: reg_file_array;

    begin
        --OutR1 <= (others=>'0');
        --OutR2 <= (others=>'0');
        
        PROCESS (clk, rst) begin
            IF rst = '1' THEN
                OutR1 <= (others=>'0');
                OutR2 <= (others=>'0');
                loop1: FOR i in 0 to 7 loop 
                    rData(i) <= (others=>'0');
                END LOOP loop1;
            ELSE 
                OutR1 <= rData(to_integer(unsigned(R1))); 
                OutR2 <= rData(to_integer(unsigned(R2))); 
                IF regWrt1 = '1'THEN
                    rData(to_integer(unsigned(Rdest1))) <= DWrite1;
                END IF;
                IF regWrt2 = '1' THEN
                    rData(to_integer(unsigned(Rdest2))) <= DWrite2;
                END IF;
            END IF;
        END PROCESS;
end reg_file_imp ; -- reg_file_imp
