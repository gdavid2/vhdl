library ieee;
use ieee.std_logic_1164.all;

entity shreg8 is
	port( clk: in std_logic;
			clr: in std_logic;
			load_or_shift: in std_logic;
			shift_direction: in std_logic;
			added_bit: in std_logic;
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0));
end entity;

architecture arch of shreg8 is

	signal reg: std_logic_vector(7 downto 0);

begin
	process (clr, clk)
	begin
		if clr= '1' then
			reg <= (others => '0');
			
		elsif rising_edge(clk) then
			if load_or_shift= '1' then
				reg <= input;
				
			elsif load_or_shift='0' then
				if shift_direction= '1' then
					reg <= added_bit & reg(6 downto 0);
				
				elsif shift_direction= '0' then
					reg <= reg(7 downto 1) & added_bit;
				
				end if;
			end if;
		end if;
	end process;
	
	output <= reg;
	
end architecture;