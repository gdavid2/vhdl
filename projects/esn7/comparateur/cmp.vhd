library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cmp is
	port( clk: in std_logic;
			input: in std_logic_vector(15 downto 0);
			seuil: in std_logic_vector(15 downto 0);
			output: out std_logic);
end entity;

architecture seq of cmp is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if input >= seuil then
				output <= '1';
			else 
				output <= '0';
			end if;
		end if;
	end process;
end architecture;