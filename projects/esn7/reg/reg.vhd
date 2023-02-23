library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg is
	port( avs_read: in std_logic;
			avs_write: in std_logic;
	
			avs_address: in std_logic_vector(3 downto 0);
			avs_writedata: in std_logic_vector(15 downto 0);
			avs_readdata: out std_logic_vector(15 downto 0);
			
			clr: in std_logic;
			
			time_output_high: out std_logic_vector(15 downto 0);
			dead_time: out std_logic_vector(15 downto 0);
			half_period: out std_logic_vector(15 downto 0));
end entity;

architecture comb of reg is

-- bit 2 : MARCHE/ARRET: 		1 <= MARCHE, 0 <= ARRET
-- bit 1 : INTERRUPT ENABLE:	1 <= ENABLE, 0 <= DISABLE
-- bit 0 : INTERRUPT FLAG:		1 <= ON	  , 0 <= OFF
	signal registre_etat: std_logic_vector(2 downto 0);
	
	signal time_output_high_int: 	std_logic_vector(15 downto 0);
	signal dead_time_int: 			std_logic_vector(15 downto 0);
	signal half_period_int: 		std_logic_vector(15 downto 0);

begin
	process(clr)
	begin
		if clr= '1' then
			registre_etat <= "000";
			
		else
			
		
		end if;
	end process;
	
	time_output_high <= time_output_high_int;
	dead_time <= dead_time_int;
	half_period <= half_period_int;
	
end architecture;