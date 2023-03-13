library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_mli_compl is
end entity;

architecture seq of tb_mli_compl is

	signal csi_clk: std_logic;
	signal csi_reset: std_logic;
			
	signal avs_address: std_logic_vector(1 downto 0);
			
	signal avs_read: std_logic;
	signal avs_write: std_logic;

	signal avs_readdata: std_logic_vector(15 downto 0);
	signal avs_writedata: std_logic_vector(15 downto 0);

	signal Sh: std_logic;
	signal Sl: std_logic;
	
	signal ins_irq: std_logic;

begin

	U1: entity work.mli_compl port map(csi_clk,
	                                   csi_reset,
												  avs_address,
												  avs_read,
												  avs_write,
												  avs_readdata,
												  avs_writedata,
												  Sh,
												  Sl,
												  ins_irq);
	
	CLOCK: process
	begin
		csi_clk <= '1';
		wait for 5 ns;
		csi_clk <= '0';
		wait for 5 ns;
	end process;
	
	RESET: process
	begin
		csi_reset <= '1',						--init
		             '0' after 40 ns,		
						 '1' after 4500 ns,	--test pour vérifier la raz des registres
					    '0' after 4600 ns;
		wait;
	end process;
	
	ADDR: process
	begin
		avs_address <= "00",						--registre_etat
		               "11" after 1200 ns,	--half_period
							"10" after 2000 ns,	--dead_time
							"01" after 3000 ns; 	--time_output_high
		wait;
	end process;
	
	RD: process
	begin
		avs_read <= '0';	--tests en lecture déjà validés
		wait;
	end process;
	
	WR: process
	begin
		avs_write <= '0',						--test en écriture déjà validés
		             '1' after 40 ns,
						 '0' after 60 ns,
						 '1' after 1000 ns,
						 '0' after 1100 ns,
						 '1' after 1200 ns,
						 '0' after 1250 ns,
						 '1' after 2000 ns,
						 '0' after 2100 ns,
						 '1' after 3000 ns,
						 '0' after 3100 ns;
		wait;
	end process;
	
	WRDATA: process
	begin
		avs_writedata <= (others => '0'),
		
--							  écriture dans le registre d'état, mise à 1 du bit marche/arret
		                 (15 downto 14 => '1', others => '0') after 40 ns,
							  (others => '0') after 80 ns,
							  
--							  mise à 0 du bit interrupt flag dans le registre d'etat
							  (15 downto 14 => '1', 13 => '0', others => '0') after 1000 ns,
							  
--							  réglage de la demi-période
							  (6 => '1', others => '0') after 1200 ns,
							  
--							  réglage du temps mort
							  (2 => '1', others => '0') after 2000 ns,
							  
--							  réglage du temps à l'état haut
							  (4 downto 0 => '1', others => '0') after 3000 ns;
		wait;
	end process;

end architecture;