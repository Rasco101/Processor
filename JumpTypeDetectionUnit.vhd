Library ieee;
use ieee.std_logic_1164.all;

entity JumpTypeDetectionUnit is
  port(ZF,NF,CF : in std_logic;
    BEQ,BN,BC,B : in std_logic;
  isBranching : out std_logic
  );
end JumpTypeDetectionUnit;

architecture behavior_JumpTypeDetectionUnit of JumpTypeDetectionUnit is
  signal AND0,AND1,AND2,OR0 : std_logic;
  
  begin
    AND0 <= (BEQ AND ZF);
    AND1 <= (BN AND NF);
    AND2 <= (BC AND CF);
    OR0 <= (AND0 OR AND1 OR AND2 OR B);
    isBranching <= OR0;
end behavior_JumpTypeDetectionUnit;