library ieee;
use ieee.std_logic_1164.all;	   
use ieee.numeric_std.all;

entity tb_cpt_dcpt is
end entity;

architecture seq of tb_cpt_dcpt is

	signal clk          : std_logic;
   signal clr          : std_logic;
	signal cpt_dcpt	  : std_logic;
	signal cpt          : std_logic_vector(15 downto 0);

begin

	UUT: entity work.cpt_dcpt port map(clk,
                                      clr,
												  cpt_dcpt,
                                      cpt);
  
	CLOCK: process
   begin
     clk<='1';
     wait for 5 ns;
     clk<='0';
     wait for 5 ns;
   end process;
  
   RESET: process
   begin
		clr <= '1';
		wait for 25 ns;
		clr <= '0';
		wait;
   end process;
	
	SEUIL: process
	begin
		cpt_dcpt <= '0';
		wait for 100 ns;
		cpt_dcpt <= '1';
		wait for 10 ns;
		cpt_dcpt <= '0';
		wait;
	end process;

end architecture;