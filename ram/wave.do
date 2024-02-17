onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_RAM/U0/rst_n
add wave -noupdate /TB_RAM/U0/ram_out
add wave -noupdate /TB_RAM/U0/ram_in
add wave -noupdate /TB_RAM/U0/ram_bus_8
add wave -noupdate /TB_RAM/U0/ram_add_4
add wave -noupdate /TB_RAM/U0/memory
add wave -noupdate /TB_RAM/U0/dout
add wave -noupdate /TB_RAM/U0/clk
add wave -noupdate /TB_RAM/RST_TIME
add wave -noupdate /TB_RAM/rst_n
add wave -noupdate /TB_RAM/ram_out
add wave -noupdate /TB_RAM/ram_in
add wave -noupdate /TB_RAM/ram_bus_8aaa
add wave -noupdate /TB_RAM/ram_bus_8
add wave -noupdate /TB_RAM/ram_add_4
add wave -noupdate /TB_RAM/CYCLE
add wave -noupdate /TB_RAM/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {525 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 196
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
WaveRestoreZoom {0 ns} {627 ns}
