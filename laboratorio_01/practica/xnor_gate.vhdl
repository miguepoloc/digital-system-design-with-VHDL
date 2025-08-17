library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xnor_gate is
  port (
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end xnor_gate;

architecture Behavioral of xnor_gate is
begin

  -- Operación XNOR
  Y <= A xnor B;
end Behavioral;