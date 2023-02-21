library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_mli is
end entity;

architecture seq of tb_mli is

	signal clk: 					std_logic;
	signal clr: 					std_logic;
	signal seuil_output_high: 	std_logic_vector(15 downto 0);
	signal seuil_output_low: 	std_logic_vector(15 downto 0);
	signal half_period: 			std_logic_vector(15 downto 0);
	signal output_high: 			std_logic;
	signal output_low: 			std_logic;

begin
	
	UUT: entity work.mli port map(clk,
											clr,
											seuil_output_high,
											seuil_output_low,
											half_period,
											output_high,
											output_low);
											
	CLOCK: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	RESET: process
	begin
		clr <= '0';
		wait for 20 ns;
		clr <= '1';
		wait for 15 ns;
		clr <= '0';
		wait;
	end process;
	
	ENTRY: process
	begin
		seuil_output_high <= "0000000000010000";
		seuil_output_low  <= "0000000000011000";
		half_period		  <= "0000000000100000";
		wait;
	end process;
	
end architecture;