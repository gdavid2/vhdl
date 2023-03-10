library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cmp_2 is
	port( clk: in std_logic;
			input: in std_logic_vector(15 downto 0);
			seuil_1: in std_logic_vector(15 downto 0);
			seuil_2: in std_logic_vector(15 downto 0);
			output_high: out std_logic;
			output_low: out std_logic);
end entity;

architecture arch_cmp_2 of cmp_2 is

	signal output_high_int: std_logic;
	signal output_low_int: std_logic;

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if input >= seuil_1 then
				output_high_int <= '0';
			else
				output_high_int <= '1';
			end if;
			
			if input > seuil_2 then 
				output_low_int <= '1';
			else
				output_low_int <= '0';
			end if;
			
		end if;
	end process;
	
	output_high <= output_high_int;
	output_low <= output_low_int;
	
end architecture;