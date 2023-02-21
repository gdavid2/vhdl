transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/vhdl/vhdl_git/esn7/comparateur_2_seuils/cmp_2.vhd}

vcom -93 -work work {C:/vhdl/vhdl_git/esn7/comparateur_2_seuils/tb_cmp_2.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb_cmp_2

add wave *
view structure
view signals
run 5 us
