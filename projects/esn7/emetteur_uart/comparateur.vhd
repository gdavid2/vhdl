library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparateur is
	port( seuil: in integer;
			input: in integer;
			output: out std_logic);
end entity;

architecture arch of comparateur is
begin
	output <= '0' when input < seuil else
				 '1';
end architecture;