library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;



entity SPControl is
  port (
    clk, rst, en, dir: IN std_logic;
    SPAddress: OUT  std_logic_vector(10 downto 0)
  ) ;
end SPControl;

architecture SPControl_imp of SPControl is

      SIGNAL next_empty: INTEGER;

begin
    
    process(en, dir, clk) 
        VARIABLE index: INTEGER;
    begin  
        index := next_empty;
        if (rst = '1') THEN
            index := (2 ** 11) - 1;	
		    next_empty <= (2 ** 11) - 1;	
            SPAddress <= std_logic_vector(to_unsigned(2 ** 11, 11) - 1);
        ELSIF (rising_edge(clk)) THEN
            IF (en = '1') THEN
                IF (dir = '1') THEN
                    if (index = 2047) THEN
                        report "Stack Is Empty cannot use POP";
                    ELSE
                        SPAddress <= std_logic_vector(to_unsigned(index, 11)) + 1;
                        index := index + 2;
                    END IF;
                ELSE
                    SPAddress <= std_logic_vector(to_unsigned(index, 11)) - 1;
                    index := index - 2;
                END IF;
            END IF;       
        END if;
        next_empty <= index;       
    END PROCESS;
end SPControl_imp ; -- SPControl_imp