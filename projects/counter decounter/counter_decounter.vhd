library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_decounter is
	port (clk: in std_logic;
				load_or_cnt: in std_logic;
        cnt_or_dcnt: in std_logic;
				e: in integer range 0 to 65535;
        r: out std_logic;
				s: out integer range 0 to 65535);
end entity;

architecture seq of counter_decounter is
	signal cnt: integer range 0 to 65535;
	
begin
	process(clk)	
	begin
		if rising_edge(clk) then
			if load_or_cnt = '0' then
				cnt <= e;
			elsif load_or_cnt = '1' then
				if cnt_or_dcnt = '1' then
					if cnt = 65535 then
						cnt <= 0;
						r <= '1';
					else
						cnt <= cnt + 1;
						r <= '0';
					end if;
				elsif cnt_or_dcnt = '0' then
					if cnt = 0 then
						cnt <= 65535;
						r <= '1';
					else
						cnt <= cnt - 1;
						r <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;

	s <= cnt;
end architecture;

