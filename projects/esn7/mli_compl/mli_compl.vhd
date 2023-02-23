library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mli_compl is
	port( csi_clk: in std_logic;
			csi_reset: in std_logic;
			avs_address: in std_logic;
			avs_read: in std_logic;
			avs_write: in std_logic;
			avs_writedata: in std_logic;
			avs_readdata: out std_logic;
			ins_irq: out std_logic;
			Sh: out std_logic;
			Sl: out std_logic);
end entity;

architecture seq of mli_compl is
begin
end architecture;