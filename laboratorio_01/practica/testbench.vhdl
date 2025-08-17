-- Se cargan las librerías estándar necesarias
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Definición del testbench (no tiene entradas ni salidas externas)
entity tb_xnor_gate is
end tb_xnor_gate;

-- Comienza la arquitectura del testbench
architecture sim of tb_xnor_gate is

  -- Paso 1: Declaración del DUT (Device Under Test)
  -- Esto permite instanciar el diseño real dentro del testbench
  component xnor_gate
    port (
      A : in std_logic; -- Entrada A del DUT
      B : in std_logic; -- Entrada B del DUT
      Y : out std_logic -- Salida Y (resultado XNOR)
    );
  end component;

  -- Paso 2: Declaración de señales internas
  -- Estas señales simulan el "cableado" del DUT
  signal A_sig : std_logic := '0'; -- Señal interna conectada a la entrada A
  signal B_sig : std_logic := '0'; -- Señal interna conectada a la entrada B
  signal Y_sig : std_logic; -- Señal interna conectada a la salida Y

begin

  -- Paso 3: Instanciación del DUT (Unit Under Test)
  -- Conecta las señales internas a las entradas y salidas del DUT
  UUT : xnor_gate
  port map
  (
    A => A_sig,
    B => B_sig,
    Y => Y_sig
  );

  -- Paso 4: Proceso de estimulación (bloque secuencial)
  process
  begin

    -- Prueba 1: A=0, B=0. Se espera que Y=1
    A_sig <= '0'; -- Entrada A recibe 0
    B_sig <= '0'; -- Entrada B recibe 0
    wait for 10 ns; -- Espera 10 nanosegundos
    report "A=0 B=0 => Y=" & std_logic'image(Y_sig);

    -- Prueba 2: A=0, B=1. Se espera que Y=0
    A_sig <= '0'; -- Entrada A mantiene 0
    B_sig <= '1'; -- Entrada B cambia a 1
    wait for 10 ns;
    report "A=0 B=1 => Y=" & std_logic'image(Y_sig);

    -- Prueba 3: A=1, B=0. Se espera que Y=0
    A_sig <= '1'; -- Entrada A cambia a 1
    B_sig <= '0'; -- Entrada B cambia a 0
    wait for 10 ns;
    report "A=1 B=0 => Y=" & std_logic'image(Y_sig);

    -- Prueba 4: A=1, B=1. Se espera que Y=1
    A_sig <= '1'; -- Entrada A mantiene 1
    B_sig <= '1'; -- Entrada B cambia a 1
    wait for 10 ns;
    report "A=1 B=1 => Y=" & std_logic'image(Y_sig);

    -- Fin de la simulación
    wait;

  end process;

end sim;