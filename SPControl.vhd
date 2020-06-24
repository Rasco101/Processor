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
    process(clk) 
	begin  
        if (rst = '1') THEN
		    next_empty <= (2 ** 11) - 1;	
            SPAddress <= std_logic_vector(to_unsigned(next_empty, 11) - 1);
        elsif (rising_edge(clk)) THEN
            if (en = '1') THEN
                if (dir = '1')THEN
                    IF (next_empty = 2047) THEN
                        report "Stack is Empty Can't use POP" severity warning;
                    ELSE
                        next_empty <= next_empty + 2;
                        SPAddress <= std_logic_vector(to_unsigned(next_empty + 2, 11)) - 1;
                    END IF;
                else
                    next_empty <= next_empty - 2;
                    SPAddress <= std_logic_vector(to_unsigned(next_empty, 11)) - 1;
                END if;
            END if;
        END if;
    END PROCESS;
end SPControl_imp ; -- SPControl_imp