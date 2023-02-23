library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cpt_dcpt is
	port (clk: in std_logic;
         clr: in std_logic;
			cpt_dcpt: in std_logic;
			cpt: out std_logic_vector(15 downto 0);
			end_cycle_irq: out std_logic);
end entity;

architecture seq of cpt_dcpt is
	
	signal cpt_int: std_logic_vector(15 downto 0);
	signal end_cycle_irq_int: std_logic;
	
	type t_state is (COMPTAGE,DECOMPTAGE);
	signal state: t_state; 
	
begin
	process(clk,clr,cpt_dcpt)
	begin
		if (clr= '1') then
			cpt_int <= "0000000000000000";
			end_cycle_irq_int <= '0';
			state <= COMPTAGE;
			
		elsif cpt_dcpt= '1' and rising_edge(clk) then
			state <= DECOMPTAGE;
			cpt_int <= cpt_int - 1;
			
		elsif rising_edge(clk) then
			case state is
			
			when COMPTAGE =>
				end_cycle_irq_int <= '0';
				
				if cpt_int = "1111111111111111" then
					cpt_int <= cpt_int - 1;
					state <= DECOMPTAGE;
				else
					cpt_int <= cpt_int + 1;
				end if;
				
			when DECOMPTAGE =>
				if cpt_int = "0000000000000000" then
					cpt_int <= cpt_int + 1;
					end_cycle_irq_int <= '1';
					state <= COMPTAGE;
				else
					cpt_int <= cpt_int - 1;
				end if;
			end case;
			
		end if;
	end process;

	cpt <= cpt_int;
	end_cycle_irq <= end_cycle_irq_int;
	
end architecture;