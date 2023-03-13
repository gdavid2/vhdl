library ieee;
use ieee.std_logic_1164.all;

entity emetteur is
	port( clk: in std_logic;
			clr: in std_logic;
			tx_data:  in std_logic_vector(7 downto 0);
			start: in std_logic;
			ready: out std_logic;
			debit: in std_logic_vector(1 downto 0);
			txd: out std_logic);
end entity;

architecture arch of emetteur is
	type t_etat is (IDLE, TRANSMISSION);
	signal etat: t_etat;
begin
	process(clr, clk)
	begin
		if clr= '1' then
			ready<= '0';
			txd  <= '1';
		
		elsif rising_edge(clk) then
			case etat is
			when IDLE =>
				ready<= '1';
				
			when TRANSMISSION =>
				ready<= '0';
				
				
			end case;
		end if;
	end process;
end architecture;