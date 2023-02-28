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
	
	signal end_cycle_irq: std_logic;
			
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
												end_cycle_irq,
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
		wait for 80 ns;
		
		reset <= '0';
		wait;
	end process;
	
--	test1: lecture du registre
--	test2: ecriture dans un registre
--	test3: lecture du registre modifié
--	test4: lecture et ecriture simultannee, operation interdite
-- test5: fin de cycle, activation du flag
-- test6: raz du flag
	
	ADR: process
	begin
--		init
		avs_address <= "00";
		wait for 80 ns;
		
--		test1
		avs_address <= "01";
		wait for 80 ns;
		
--		test2
		avs_address <= "11";
		wait for 80 ns;
		
--		test3
		wait for 80 ns;
		
--    test4
		wait for 80 ns;
		
--    test5
		avs_address <= "00";
		wait for 80 ns;
		
--    test6
		wait for 80 ns;
		
		wait;
	end process;
	
	RD: process
	begin
--		init
		avs_read <= '0';
		wait for 80 ns;
		
--		test1
		avs_read <= '1';
		wait for 40 ns;
		avs_read <= '0';
		wait for 40 ns;
		
--		test2
		wait for 80 ns;
		
--		test3
		avs_read <= '1';
		wait for 40 ns;
		avs_read <= '0';
		wait for 40 ns;

--    test4
		avs_read <= '1';
		wait for 40 ns;
		avs_read <= '0';
		wait for 40 ns;
		
--    test5
		wait for 80 ns;
		
--    test6
		wait for 80 ns;
		
		wait;
	end process;
	
	WR: process
	begin
--		init
		avs_write <= '0';
		wait for 80 ns;
		
--		test1
		wait for 80 ns;
		
--		test2
		avs_write <= '1';
		wait for 40 ns;
		avs_write <= '0';
		wait for 40 ns;
		
--		test3
		wait for 80 ns;
		
--    test4
		avs_write <= '1';
		wait for 40 ns;
		avs_write <= '0';
		wait for 40 ns;
		
--    test5
		wait for 80 ns;
		
--    test6
		avs_write <= '1';
		wait for 40 ns;
		avs_write <= '0';
		wait for 40 ns;
		
		wait;
	end process;
	
	WRDATA: process
	begin
--		init
		avs_writedata <= (others => '0');
		wait for 80 ns;
		
--		test1
		wait for 80 ns;
		
--		test2
		avs_writedata <= (15 downto 13 => '1', others => '0');
		wait for 40 ns;
		avs_writedata <= (others => '0');
		wait for 40 ns;
		
--		test3
		wait for 80 ns;
		
--    test4
		avs_writedata <= (15 downto 13 => '1', others => '0');
		wait for 80 ns;
		
--    test5
		wait for 80 ns;
		
--    test6
		avs_writedata <= (15 downto 14 => '1', 13 => '0', others => '0');
		wait for 80 ns;
		
		wait;
	end process;
	
	FLAG: process
	begin
--		init
		end_cycle_irq <= '0';
		wait for 80 ns;
		
--		test1
		wait for 80 ns;
		
--		test2
		wait for 80 ns;
		
--		test3
		wait for 80 ns;
		
--		test4
		wait for 80 ns;
		
--		test5
		wait for 40 ns;
		end_cycle_irq <= '1';
		wait for 10 ns;
		end_cycle_irq <= '0';
		wait for 30 ns;
		
--		test6
		wait for 80 ns;
		
		wait;
	end process;

end architecture;