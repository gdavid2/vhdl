transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/vhdl/vhdl_git/esn7/counter_decounter/cpt_dcpt.vhd}

vcom -93 -work work {C:/vhdl/vhdl_git/esn7/counter_decounter/tb_cpt_dcpt.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb_cpt_dcpt

add wave *
view structure
view signals
run 5 us
