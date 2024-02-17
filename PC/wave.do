onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_pc/RST_TIME
add wave -noupdate /tb_pc/rst_n
add wave -noupdate /tb_pc/pc_out
add wave -noupdate /tb_pc/pc_jmp
add wave -noupdate /tb_pc/pc_en
add wave -noupdate /tb_pc/pc_bus
add wave -noupdate /tb_pc/CYCLE
add wave -noupdate /tb_pc/clk
add wave -noupdate /tb_pc/apc_bus
add wave -noupdate /tb_pc/u0/pc_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {143 ns} 0}
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
WaveRestoreZoom {0 ns} {240 ns}
