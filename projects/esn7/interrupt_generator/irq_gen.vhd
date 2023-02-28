library ieee;
use ieee.std_logic_1164.all;

entity irq_gen is
	port(clk: in std_logic;
	     clr: in std_logic;
		  registre_etat: in std_logic_vector(2 downto 0);
		  irq: out std_logic);
end entity;

architecture seq of irq_gen is

	signal irq_int: std_logic;

begin
	process(clk, clr)
	begin
		if clr= '1' or registre_etat(2)= '0' then
			irq_int <= '0';
		elsif rising_edge(clk) then
			irq_int <= registre_etat(0) and registre_etat(1); 
		end if;
	end process;
	
	irq <= irq_int;
	
end architecture;