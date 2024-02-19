transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {e:/quartusii/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {e:/quartusii/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {e:/quartusii/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {e:/quartusii/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {e:/quartusii/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {e:/quartusii/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/top.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/RAM.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/pc.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/out.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/MAR.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/IR.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/flag.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/CU.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/ALU.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/top/A_reg.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/cpu8.v}
vlog -vlog01compat -work work +incdir+E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga {E:/desktop/cpu_8bit_fpga/cpu_8bit_fpga/inpll.v}
vlog -vlog01compat -work work +incdir+E:/Supra-2023.02.b0-7773ca8a-win32-all/etc/arch/rodinia {E:/Supra-2023.02.b0-7773ca8a-win32-all/etc/arch/rodinia/alta_sim.v}

