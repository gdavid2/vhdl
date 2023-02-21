transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/vhdl/projects/esn7/comparateur/cmp.vhd}
vcom -93 -work work {C:/vhdl/projects/esn7/comparateur_2_seuils/cmp_2.vhd}
vcom -93 -work work {C:/vhdl/projects/esn7/counter_decounter/cpt_dcpt.vhd}
vcom -93 -work work {C:/vhdl/projects/esn7/mli_sync/mli.vhd}

vcom -93 -work work {C:/vhdl/projects/esn7/mli_sync/tb_mli.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb_mli

add wave *
view structure
view signals
run 5 us
