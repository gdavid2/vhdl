library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_avs_ui is
end entity;

architecture seq of tb_avs_ui is

	signal clk:   std_logic;
	signal reset: std_logic;
			
	signal avs_address: std_logic_vector(1 downto 0);
			
	signal avs_read:  std_logic;
	signal avs_write: std_logic;
			
	signal avs_readdata:  std_logic_vector(15 downto 0);
	signal avs_writedata: std_logic_vector(15 downto 0);
			
	signal clr: std_logic;
			
	signal registre_etat: std_logic_vector(2 downto 0);
	signal time_output_high: std_logic_vector(15 downto 0);
	signal dead_time: std_logic_vector(15 downto 0);
	signal half_period: std_logic_vector(15 downto 0);

begin

	UUT: entity work.avs_ui port map(clk, 
												reset, 
												avs_address,
												avs_read,
												avs_write,
												avs_readdata,
												avs_writedata,
												clr,
												registre_etat,
												time_output_high,
												dead_time,
												half_period);

	CLOCK: process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	RST: process
	begin
		reset <= '1';
		wait for 20 ns;
		
		reset <= '0';
		wait;
	end process;
	
	ADR: process
	begin
--		init
		avs_address <= "00";
		
--		test1
--		test2
		wait until 40 ns;
		
	end process;
	
	RD: process
	begin
--		init
		avs_read  <= '0';
		
--		test1
		wait until 30 ns;
		
		avs_read <= '1';
		wait for 5 ns;
		
		avs_read <= '0';
		
--		test2
		
		
	end process;
	
	WR: process
	begin
--		init
		avs_write <= '0';
		
--		test1
--		test2
		wait until 40 ns;
		
		avs_write <= '1';
		wait for 5 ns;
		
		avs_write <= '0';
	end process;
	
	WRDATA: process
	begin
--		init
		avs_writedata <= (others => '0');
		
--		test1
--		test2
		wait until 40 ns;
		
		avs_writedata <= "111" & (others => '0');
		wait for 10 ns;
		
		avs_writedata <= (others => '0');
		
	end process;

end architecture;