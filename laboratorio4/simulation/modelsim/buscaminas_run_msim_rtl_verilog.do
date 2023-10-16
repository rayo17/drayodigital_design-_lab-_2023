transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4 {C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4/board.sv}
vlog -sv -work work +incdir+C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4 {C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4/tb_board.sv}
vlog -sv -work work +incdir+C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4 {C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4/bombGenerator.sv}
vlog -sv -work work +incdir+C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4 {C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4/GameBoard.sv}

vlog -sv -work work +incdir+C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4 {C:/Users/pepev/OneDrive/Documentos/GitHub/drayodigital_design-_lab-_2023/laboratorio4/tb_board.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_board

add wave *
view structure
view signals
run -all
