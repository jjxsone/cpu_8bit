onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ir/RST_TIME
add wave -noupdate /tb_ir/rst_n
add wave -noupdate /tb_ir/ir_out
add wave -noupdate /tb_ir/ir_ins
add wave -noupdate /tb_ir/ir_in
add wave -noupdate /tb_ir/ir_busa
add wave -noupdate /tb_ir/ir_bus
add wave -noupdate /tb_ir/ir_add
add wave -noupdate /tb_ir/CYCLE
add wave -noupdate /tb_ir/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {450 ns} 0}
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
WaveRestoreZoom {0 ns} {646 ns}
