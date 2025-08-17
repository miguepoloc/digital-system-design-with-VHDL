-------------------------------------------------------------------
-- Nombre de Integrantes Grupo: Nombres estudiantes
-- Practica 1: Introduccion a la Simulacion usando VHDL
-- Fecha: dia/mes/año
-------------------------------------------------------------------

-- Librerías para el componente sumador_completo
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Definición de la entidad del sumador completo
entity sumador_completo is
  port (
    A    : in std_logic; -- Primer bit de entrada
    B    : in std_logic; -- Segundo bit de entrada
    Cin  : in std_logic; -- Bit de acarreo de entrada
    S    : out std_logic; -- Suma resultante
    Cout : out std_logic -- Acarreo de salida
  );
end sumador_completo;

-- Definición de la arquitectura del sumador completo
architecture Behavioral of sumador_completo is
begin
  -- Operación del sumador completo
  S    <= (A xor B) xor Cin;
  Cout <= (A and B) or (A and Cin) or (B and Cin);
end Behavioral;
