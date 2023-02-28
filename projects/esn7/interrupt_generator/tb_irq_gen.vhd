library ieee;
use ieee.std_logic_1164.all;

entity tb_irq_gen is
end entity;

architecture seq of tb_irq_gen is

	signal clk, clr: std_logic;
	signal registre_etat: std_logic_vector(2 downto 0);
	signal irq: std_logic;

begin

	UUT: entity work.irq_gen port map(clk,
	                                  clr,
												 registre_etat,
												 irq);
												 
	CLOCK: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	RESET: process
	begin
		clr <= '1';
		wait for 20 ns;
		clr <= '0';
		wait;
	end process;

end architecture;