create_clock -name "clk_100MHz" -period 10.000ns [ get_ports CLK ]

derive_pll_clocks -create_base_clocks

derive_clock_uncertainty