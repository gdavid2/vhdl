library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_MLI is
end entity;

architecture arch_tb_MLI of tb_MLI is

	signal clk: std_logic;
	signal clr: std_logic;
	signal alpha: std_logic_vector(7 downto 0);
	signal Q: std_logic_vector(7 downto 0);
	signal S: std_logic;
	signal Fc: std_logic;
	
begin
	DUT: entity work.MLI port map(clk => clk,
											clr => clr,
											alpha => alpha,
											Q => Q,
											S => S,
											Fc => Fc);
	
	HORLOGE: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	RESET: process
	begin
		clr <= '1';
		wait for 35 ns;
		clr <= '0';
		wait for 3200 ns;
		clr <= '1';
		wait for 16 ns;
		clr <= '0';
	end process;
	
	STIMULIS: process
	begin
		alpha <= "10000000";
		wait for 2500 ns;
		alpha <= "01000000";
		wait for 1000 ns;
	end process;
end architecture;
		