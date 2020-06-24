Library ieee;
use ieee.std_logic_1164.all;

entity ForwardUnit is
  port(EX_MEM_RegWrite,MEM_WB_RegWrite : in std_logic;
  EX_MEM_Rdst,ID_EX_RS,ID_EX_RT,MEM_WB_RD : in std_logic_vector(2 downto 0);
  RS_Forward,RT_Forward: out std_logic_vector(1 downto 0)
  );
end ForwardUnit;

architecture behavior_ForwardUnit of ForwardUnit is
  begin
    RS_Forward <= "10" when EX_MEM_RegWrite = '1' and EX_MEM_Rdst = ID_EX_RS
    else "01" when MEM_WB_RegWrite = '1' and (EX_MEM_RegWrite = '0' or EX_MEM_Rdst = ID_EX_RS)
    and MEM_WB_RD = ID_EX_RS
    else "00";
      
    RT_Forward <= "10" when EX_MEM_RegWrite = '1' and EX_MEM_Rdst = ID_EX_RT
    else "01" when MEM_WB_RegWrite = '1' and (EX_MEM_RegWrite = '0' or EX_MEM_Rdst = ID_EX_RT)
    and MEM_WB_RD = ID_EX_RT
    else "00";
end behavior_ForwardUnit;