library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_cmp is
end entity;

architecture seq of tb_cmp is
	
	signal clk: std_logic;
	signal input: std_logic_vector(15 downto 0);
	signal seuil: std_logic_vector(15 downto 0);
	signal output: std_logic;
	
begin

	UUT: entity work.cmp port map(clk,
											input,
											seuil,
											output);
											
	CLOCK: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	seuil <= "0000000000010000";
	
	INP: process
	begin
		input <= "0000000000000000";
		wait for 100 ns;
		
		input <= "0000000000010000";
		wait for 100 ns;
		
		input <= "1000000000000000";
		wait;
	end process;
	
end architecture;