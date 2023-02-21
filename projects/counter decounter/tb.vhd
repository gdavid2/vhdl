library ieee;
use ieee.std_logic_1164.all;	   
use ieee.numeric_std.all;

entity tb is
end tb;

architecture seq of tb is

  signal clk          : std_logic;
	signal load_or_cnt  : std_logic;
  signal cnt_or_dcnt  : std_logic;
	signal e            : integer range 0 to 65535;
  signal r            : std_logic;
	signal s            : integer range 0 to 65535;

begin

  UUT: entity work.counter_decounter port map(clk, 
                                              load_or_cnt, 
                                              cnt_or_dcnt, 
                                              e, 
                                              r, 
                                              s);
  
  CLOCK: process
  begin
    clk<='1';
    wait for 5 ns;
    clk<='0';
    wait for 5 ns;
  end process;

  LC: process
  begin
    load_or_cnt <= '0',
                   '1' after 15 ns;
    wait;
  end process;
    
  CNT: process 
  begin
    cnt_or_dcnt <= '1',
                   '0' after 85 ns;
    wait;
  end process;

  ENTRY: process
  begin
    e <= 7 after 5 ns;
    wait;
  end process;

end architecture;

