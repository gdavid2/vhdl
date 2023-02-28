library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity avs_ui is
	port( clk: in std_logic;
			reset: in std_logic;
			
--			"00" -> registre_etat
--			"01" -> time_output_high
--			"10" -> dead_time
--			"11" -> half_period
			avs_address: in std_logic_vector(1 downto 0);
			
			avs_read: in std_logic;
			avs_write: in std_logic;
			
			avs_readdata: out std_logic_vector(15 downto 0);
			avs_writedata: in std_logic_vector(15 downto 0);
			
			end_cycle_irq: in std_logic;
			
			clr: out std_logic;
			
--			registres
			registre_etat: out std_logic_vector(2 downto 0);
			time_output_high: out std_logic_vector(15 downto 0);
			dead_time: out std_logic_vector(15 downto 0);
			half_period: out std_logic_vector(15 downto 0));
end entity;

architecture seq of avs_ui is

	signal clr_int: std_logic;
	signal avs_readdata_int: std_logic_vector(15 downto 0);
	
	signal commande: std_logic_vector(3 downto 0);
	
-- bit 2 : MARCHE/ARRET: 		1 <= MARCHE, 0 <= ARRET
-- bit 1 : INTERRUPT ENABLE:	1 <= ENABLE, 0 <= DISABLE
-- bit 0 : INTERRUPT FLAG:		1 <= HIGH  , 0 <= LOW
	signal registre_etat_int: std_logic_vector(2 downto 0);
	
	signal time_output_high_int: 	std_logic_vector(15 downto 0);
	signal dead_time_int: 			std_logic_vector(15 downto 0);
	signal half_period_int: 		std_logic_vector(15 downto 0);
	
begin
	
	commande <= avs_address & avs_read & avs_write;	
	
	process(clk, reset)
	begin
		if reset= '1' then
			clr_int <= '1';
			avs_readdata_int <= (others => '0');
			
			registre_etat_int		<= "000";				  -- all off
			time_output_high_int	<= "0000000000010000"; -- 16
			dead_time_int			<= "0000000000000011"; -- 3
			half_period_int		<= "0000000000100000"; -- 32
			
		elsif rising_edge(clk) then
			clr_int <= '0';
			
			case commande is
--			read
			when "0010" =>
				avs_readdata_int <= registre_etat_int & "0000000000000";
			when "0110" =>
				avs_readdata_int <= time_output_high_int;
			when "1010" =>
				avs_readdata_int <= dead_time_int;
			when "1110" =>
				avs_readdata_int <= half_period_int;
			
--			write	
			when "0001" =>
				registre_etat_int 	<= avs_writedata(15 downto 13);
			when "0101" =>
				time_output_high_int <= avs_writedata;
			when "1001" =>
				dead_time_int 			<= avs_writedata;
			when "1101" =>
				half_period_int 		<= avs_writedata;
			
--			idle ou interdit
			when others =>
				avs_readdata_int <= "0000000000000000";
				
				if registre_etat_int(0)= '0' then
					registre_etat_int(0) <= end_cycle_irq;
				end if;
				
			end case;
		end if;
	end process;
	
	clr <= clr_int;
	
	avs_readdata <= avs_readdata_int;
	
	time_output_high  <= time_output_high_int;
	dead_time 			<= dead_time_int;
	half_period 		<= half_period_int;
	registre_etat 		<= registre_etat_int;
	
end architecture;