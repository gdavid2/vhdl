library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity avs_ui is
	port( clk: in std_logic;
			reset: in std_logic;
			avs_address: in std_logic_vector(15 downto 0);
			avs_read: in std_logic;
			avs_write: in std_logic;
			avs_writedata: in std_logic_vector(15 downto 0);
			avs_readdata: out std_logic_vector(15 downto 0);
			clr: out std_logic);
end entity;

architecture seq of avs_ui is

	signal clr_int: std_logic;
	signal avs_readdata_int: std_logic_vector(15 downto 0);
	
	
	
	type t_bus_state is (IDLE, RD, WR);
	signal bus_state: t_bus_state;
	
begin
	
	CONTROL_STATE: process(clk, reset)
	begin
		if reset= '1' then
			bus_state <= IDLE;
			
		elsif rising_edge(clk) then
			if avs_read= '1' and bus_state= IDLE then
				bus_state <= RD;
				
			elsif avs_write= '1' and bus_state= IDLE then
				bus_state <= WR;
			
			elsif avs_read= '0' and avs_write= '0' then
				bus_state <= IDLE;
				
			end if;
		end if;
	end process;
	
	STATE: process(clk, reset)
	begin
		if reset= '1' then
			
		elsif rising_edge(clk) then
			case bus_state is
			when IDLE =>
			
			when RD =>
				
			when WR =>
				
			end case;
		end if;
	end process;
	
	clr <= clr_int;
	avs_readdata <= avs_readdata_int;
	
end architecture;