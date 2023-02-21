library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mli is
	port(clk: in std_logic;
		  clr: in std_logic;
		  seuil_output_high: in std_logic_vector(15 downto 0);
		  seuil_output_low: in std_logic_vector(15 downto 0);
		  half_period: in std_logic_vector(15 downto 0);
		  output_high: out std_logic;
		  output_low: out std_logic);
end entity;

architecture seq of mli is

	signal cpt_output: std_logic_vector(15 downto 0);
	signal cmp_2_output, cmp_output: std_logic;
	
begin
	compteur_decompteur: entity work.cpt_dcpt port map(clk, 
																		clr, 
																		cmp_output, 
																		cpt_output);
																		
	comparateur: entity work.cmp port map(clk, 
													  cpt_output, 
													  half_period, 
													  cmp_output);
													  
	comparateur_2_seuils: entity work.cmp_2 port map(clk, 
																  cpt_output, 
																  seuil_output_high, 
																  seuil_output_low, 
																  output_high,
																  output_low);
																  
end architecture;						  