Library ieee;
use ieee.std_logic_1164.all;

entity ALUControlUnit is
  port(
    ALUEn : in std_logic_vector(0 downto 0);
    FunctionField : in std_logic_vector(3 downto 0);
    ALUControlInput : out std_logic_vector(3 downto 0)
  );
end ALUControlUnit;

architecture behavior_ALUControlUnit of ALUControlUnit is
  begin
    ALUControlInput <= "0000" WHEN ALUEn = "0"
      ELSE  FunctionField;

end behavior_ALUControlUnit;