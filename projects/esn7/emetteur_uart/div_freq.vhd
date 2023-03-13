library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div_freq is
	port( clk: in std_logic;
			clr: in std_logic;
			div: in std_logic_vector(1 downto 0);
			clk_out: out std_logic);
end entity;

architecture arch of div_freq is

	signal i: unsigned(9 downto 0);
	
	type t_etat is (COMPTAGE, FRONT);
	signal etat: t_etat;

begin
	
	process (clr, clk)
	begin
		if clr= '1' then
			etat <= COMPTAGE;
		
		elsif rising_edge(clk) then
			case div is
			when "01" =>
				
			
			when "10" =>
			
			
			when "11" =>
			
			
			when others =>
			
			
			end case;
		end if;
	end process;
	
	
	process (clr, clk)
	begin
		if clr= '1' then
			clk_out <= '1';
		
		elsif rising_edge(clk) then
			case etat is
			when COMPTAGE =>
				clk_out <= '0';
			
			when FRONT =>
				clk_out <= '1';
			
			end case;
		end if;
	end process;
	
end architecture;