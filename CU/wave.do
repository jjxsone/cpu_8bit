onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cu/u0/clk
add wave -noupdate /tb_cu/u0/rst_n
add wave -noupdate /tb_cu/u0/cnt
add wave -noupdate /tb_cu/u0/cu_ins
add wave -noupdate /tb_cu/u0/cu_su
add wave -noupdate /tb_cu/u0/cu_ro
add wave -noupdate /tb_cu/u0/cu_ri
add wave -noupdate /tb_cu/u0/cu_oi
add wave -noupdate /tb_cu/u0/cu_mi
add wave -noupdate /tb_cu/u0/cu_j
add wave -noupdate /tb_cu/u0/cu_io
add wave -noupdate /tb_cu/u0/cu_ii
add wave -noupdate /tb_cu/u0/cu_h
add wave -noupdate /tb_cu/u0/cu_f1
add wave -noupdate /tb_cu/u0/cu_f0
add wave -noupdate /tb_cu/u0/cu_f
add wave -noupdate /tb_cu/u0/cu_eo
add wave -noupdate /tb_cu/u0/cu_co
add wave -noupdate /tb_cu/u0/cu_ce
add wave -noupdate /tb_cu/u0/cu_bi
add wave -noupdate /tb_cu/u0/cu_ao
add wave -noupdate /tb_cu/u0/cu_ai
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0}
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
WaveRestoreZoom {0 ns} {621 ns}
