onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_reg/RST_TIME
add wave -noupdate /tb_reg/rst_n
add wave -noupdate /tb_reg/CYCLE
add wave -noupdate /tb_reg/clk
add wave -noupdate /tb_reg/a_reg
add wave -noupdate /tb_reg/a_out
add wave -noupdate /tb_reg/a_in
add wave -noupdate /tb_reg/a_cpu
add wave -noupdate /tb_reg/a_bus
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {107 ns} 0}
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
WaveRestoreZoom {0 ns} {197 ns}
