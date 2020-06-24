library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY External_Port IS 
   PORT(
       clk, rst: std_logic;
       --PortData: INOUT std_logic_vector(31 downto 0);
       BiDirPort: INOUT std_logic_vector(31 downto 0);
       PortData_Ext, INPort: IN std_logic_vector(31 downto 0);
       OUTPort: OUT std_logic_vector(31 downto 0);
       PortData: OUT std_logic_vector(31 downto 0);
       --OUTData: INOUT std_logic_vector(31 downto 0);
       PortIN: IN std_logic;
       PortOUT: IN std_logic
   ); 
END External_Port;

architecture Port_imp of External_Port is
    
begin
	BiDirPort <= PortData_Ext;
	BiDirPort <= INPort;
    PROCESS (clk, rst) IS
    BEGIN
        IF (rst = '1') THEN
            OUTPort <= (others => '0');
        ELSIF(PortIN = '1') THEN
            OUTPort <= BiDirPort;
        ELSIF(PortOUT = '1') THEN
            PortData <= BiDirPort;
        END IF;
    END PROCESS;
    
    
end architecture Port_imp;