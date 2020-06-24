library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PCLatchSignals is
    port (
        Mem_RET, Mem_RTI, CALL, IsBranching: IN std_logic;
        PC_Latch: OUT std_logic 
    );
end entity PCLatchSignals;

architecture PCLatchSignals_imp of PCLatchSignals is
    
begin
    PC_Latch <= Mem_RET or Mem_RTI or CALL or IsBranching;
end architecture PCLatchSignals_imp;