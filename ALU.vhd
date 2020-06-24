library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY ALU IS
    PORT(
        clk, rst:   IN std_logic;
        A, B:       IN std_logic_vector(31 downto 0);
        sel:        IN std_logic_vector(3 downto 0);
        F:          OUT std_logic_vector(31 downto 0);
        CF, ZF, NF: OUT std_logic:= '0'  
    );
END ALU;


ARCHITECTURE rtl OF ALU IS
    
BEGIN
    PROCESS(A, B, sel) 
        VARIABLE temp: std_logic_vector(32 downto 0);
    
    BEGIN
        IF (rst = '1') THEN
            ZF <= '0';
            CF <= '0';
            NF <= '0';
            F <= (others=>'0'); 
        else
				CASE sel IS
            WHEN "0000" =>
                temp(31 downto 0) := A;
                F <= A;
            WHEN "0001" =>
                temp := ('0' & A) + ('0' & B);
                F <= temp(31 downto 0);
                CF <= temp(32);
            WHEN "0010" =>
                temp := ('0' & A) - ('0' & B);
                F <= temp(31 downto 0);
                CF <= temp(32);
            WHEN "0011" =>
                temp(31 downto 0) := A AND B;
                F <= temp(31 downto 0);
            WHEN "0100" =>
                temp(31 downto 0) := A OR B;
                F <= temp(31 downto 0);
            WHEN "0101" =>
                temp(31 downto 0) :=  NOT A;
                F <= temp(31 downto 0);
            WHEN "0110" =>
                CF <= A(to_integer(unsigned(B))-1);
                --temp(31 downto 0) := std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(8 downto 4))))) ;
                temp(31 downto 0) := std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B))));
                F <= temp(31 downto 0);
            WHEN "0111" =>
                CF <= A(32 - to_integer(unsigned(B)));
                --temp(31 downto 0) := std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(8 downto 4))))) ;
                temp(31 downto 0) := std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B)))) ;
                F <= temp(31 downto 0);
            WHEN "1000" =>
                temp := ('0' & A) + 1;
                CF <= temp(32);
                F <= temp(31 downto 0);
            WHEN "1001" => 
                temp := ('0' & A) - 1;
                CF <= temp(32);
                F <= temp(31 downto 0);
            WHEN others =>
                null;
            END CASE;
            IF (temp(31 downto 0) = "0000" and sel /= "0000") THEN
                ZF <= '1';
            ELSE 
                ZF <= '0';
            END IF;
            IF sel /= "0000" THEN
                NF <= temp(31);
            END IF;
        END IF;
        
    END PROCESS;
    
END ARCHITECTURE rtl;