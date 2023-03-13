library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
	port( clk: in std_logic;
			clr: in std_logic;
			cpt: out integer range 0 to 19200);
end entity;

architecture arch of compteur is

	signal cpt_i: integer range 0 to 19200;

begin
	process (clr, clk)
	begin
		if clr= '1' then
			cpt_i <= 0;
			
		elsif rising_edge(clk) then
			if cpt_i= 19200 then
				cpt_i <= 0;
			else
				cpt_i <= cpt_i + 1;
			end if;
		end if;
	end process;
	
	cpt <= cpt_i;
	
end architecture;
			