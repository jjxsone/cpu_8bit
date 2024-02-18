onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /tb_top/top_bus
add wave -noupdate /tb_top/RST_TIME
add wave -noupdate /tb_top/rst_n
add wave -noupdate /tb_top/CYCLE
add wave -noupdate /tb_top/clk
add wave -noupdate /tb_top/top/pc/pc_data
add wave -noupdate /tb_top/top/CU/cu_f1
add wave -noupdate /tb_top/top/ALU/alu
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76436 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {76028 ns} {76628 ns}
