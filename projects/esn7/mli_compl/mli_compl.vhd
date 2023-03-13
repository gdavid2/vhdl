library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mli_compl is
	port( csi_clk: in std_logic;
			csi_reset: in std_logic;
			
			avs_address: in std_logic_vector(1 downto 0);
			
			avs_read: in std_logic;
			avs_write: in std_logic;
			
			avs_readdata: out std_logic_vector(15 downto 0);
			avs_writedata: in std_logic_vector(15 downto 0);
			
			Sh: out std_logic;
			Sl: out std_logic;
			
			ins_irq: out std_logic);
end entity;

architecture seq of mli_compl is

	signal avs_ui_clr: std_logic;
	
	signal end_cycle_irq: std_logic;
	
--	registres
	signal registre_etat:    std_logic_vector(2 downto 0);
	signal time_output_high: std_logic_vector(15 downto 0);
	signal dead_time: 		 std_logic_vector(15 downto 0);
	signal half_period: 		 std_logic_vector(15 downto 0);

begin

	commande: entity work.avs_ui port map(csi_clk,
													  csi_reset,
													  avs_address,
													  avs_read,
													  avs_write,
													  avs_readdata,
													  avs_writedata,
													  end_cycle_irq,
													  avs_ui_clr,
													  registre_etat,
													  time_output_high,
													  dead_time,
													  half_period);
													  

	operation: entity work.mli port map(csi_clk,
													avs_ui_clr,
													registre_etat(2),
													time_output_high,
													dead_time,
													half_period,
													Sh,
													Sl,
													end_cycle_irq);
													
	interruption: entity work.irq_gen port map(csi_clk,
	                                           avs_ui_clr,
															 registre_etat,
															 ins_irq);
															 

end architecture;