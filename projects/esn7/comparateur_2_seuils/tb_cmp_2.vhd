library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_cmp_2 is
end entity;

architecture arch_tb_cmp_2 of tb_cmp_2 is

	signal clk: std_logic;
	signal seuil_1: std_logic_vector(15 downto 0);
	signal seuil_2: std_logic_vector(15 downto 0);
	signal input: std_logic_vector(15 downto 0);
	signal output_high: std_logic;
	signal output_low: std_logic;
	
begin

	UUT: entity work.cmp_2 port map(clk,
											  seuil_1,
											  seuil_2,
											  input,
											  output_high,
											  output_low);
											  
	CLOCK: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	SEUIL: process
	begin
		seuil_1 <= "0000000010000000";
		seuil_2 <= "0000000010100000";
		wait;
	end process;
	
	CPT: process
	begin
		input <= "0000000000000000";
		wait for 100 ns;
		
		input <= "0000000010000000";
		wait for 100 ns;
		
		input <= "0000000010000001";
		wait for 100 ns;
		
		input <= "0000000010100000";
		wait for 100 ns;
		
		input <= "1000000000000000";
		wait;
	end process;
		
	
end architecture;