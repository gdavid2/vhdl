-- MLI asym

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MLI is port(
	clk: in std_logic;
	clr: in std_logic;
	alpha: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0);
	S: out std_logic;
	Fc: out std_logic);
end entity;

architecture arch_MLI of MLI is

	signal Q_int: std_logic_vector(Q'range);
	signal alpha_int: std_logic_vector(alpha'range);
	
begin
	process(clr,clk)
	begin
		if (clr= '1') then
			Q_int <= (others => '0');
		elsif rising_edge(clk) then
			Q_int <= Q_int + 1;
		end if;
	end process;
	
	process(clr,clk)
	begin
		if (clr= '1') then
			S <= '1';
		elsif rising_edge(clk) then
			if ( Q_int < alpha_int or Q_int= "11111111") then
				S <= '1';
			else
				S <= '0';
			end if;
		end if;
	end process;
	
	process(clr,clk)
	begin
		if (clr= '1') then
			Fc <= '0';
			alpha_int <= alpha;
		elsif rising_edge(clk) then
			if(Q_int= "11111110") then
				Fc <= '1';
				alpha_int <= alpha;
			else
				Fc <= '0';
			end if;
		end if;
	end process;
	
	Q <= Q_int;
	
end architecture;