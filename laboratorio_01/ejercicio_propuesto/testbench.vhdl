library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_sumador_completo is
end tb_sumador_completo;

architecture sim of tb_sumador_completo is

  -- Paso 1: Declarar el DUT (Device Under Test)
  component sumador_completo
    port (
      A    : in std_logic;
      B    : in std_logic;
      Cin  : in std_logic;
      S    : out std_logic;
      Cout : out std_logic
    );
  end component;

  -- Paso 2: Declarar señales para conectar al DUT
  -- Entradas al DUT
  signal A_sig   : std_logic := '0';
  signal B_sig   : std_logic := '0';
  signal Cin_sig : std_logic := '0';

  -- Salidas del DUT
  signal S_sig    : std_logic;
  signal Cout_sig : std_logic;

begin

  -- Paso 3: Instanciar el DUT y conectar señales
  UUT : sumador_completo
  port map
  (
    -- Conectamos las señales de entrada
    A   => A_sig,
    B   => B_sig,
    Cin => Cin_sig,
    -- Conectamos las señales de salida
    S    => S_sig,
    Cout => Cout_sig
  );

  -- Paso 4: Crear el proceso de prueba
  process
  begin
    -- Comentario: probaremos las 8 combinaciones posibles

    -- Caso 1: 0 + 0 + 0
    A_sig   <= '0';
    B_sig   <= '0';
    Cin_sig <= '0';
    wait for 10 ns;
    report "A=0 B=0 Cin=0 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 2: 0 + 0 + 1
    Cin_sig <= '1';
    wait for 10 ns;
    report "A=0 B=0 Cin=1 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 3: 0 + 1 + 0
    B_sig   <= '1';
    Cin_sig <= '0';
    wait for 10 ns;
    report "A=0 B=1 Cin=0 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 4: 0 + 1 + 1
    Cin_sig <= '1';
    wait for 10 ns;
    report "A=0 B=1 Cin=1 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 5: 1 + 0 + 0
    A_sig   <= '1';
    B_sig   <= '0';
    Cin_sig <= '0';
    wait for 10 ns;
    report "A=1 B=0 Cin=0 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 6: 1 + 0 + 1
    Cin_sig <= '1';
    wait for 10 ns;
    report "A=1 B=0 Cin=1 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 7: 1 + 1 + 0
    B_sig   <= '1';
    Cin_sig <= '0';
    wait for 10 ns;
    report "A=1 B=1 Cin=0 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    -- Caso 8: 1 + 1 + 1
    Cin_sig <= '1';
    wait for 10 ns;
    report "A=1 B=1 Cin=1 => S=" & std_logic'image(S_sig) & " Cout=" &
      std_logic'image(Cout_sig);

    wait; -- Fin de la simulación

  end process;

end sim;

architecture Behavioral of sumador_completo is
begin

  -- Operación del sumador completo
  S    <= (A xor B) xor Cin;
  Cout <= (A and B) or (A and Cin) or (B and Cin);

end Behavioral;