transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Quartus_proyectos/sumador/Sumador4Bits.vhd}
vcom -93 -work work {D:/Quartus_proyectos/sumador/Sumador1Bit.vhd}
vcom -93 -work work {D:/Quartus_proyectos/sumador/Conversor.vhd}

vcom -93 -work work {D:/Quartus_proyectos/sumador/Sumador4Bits_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Sumador4Bits_tb

add wave *
view structure
view signals
run -all
