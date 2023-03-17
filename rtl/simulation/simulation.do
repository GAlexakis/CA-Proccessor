quit -sim
file delete -force work

vlib work
vlog -f files_rtl.f

vsim processor_tb
log -r /*

add wave -position end  sim:/processor_tb/clk

add wave -position end  sim:/processor_tb/instruction

add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[0]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[1]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[2]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[3]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[4]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[5]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[6]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[7]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[8]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[9]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[10]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[11]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[12]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[13]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[14]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[15]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[16]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[17]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[18]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[19]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[20]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[21]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[22]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[23]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[24]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[25]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[26]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[27]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[28]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[29]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[30]
add wave -position end  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[31]

radix signal  sim:/processor_tb/instruction hexadecimal

radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[0] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[1] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[2] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[3] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[4] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[5] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[6] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[7] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[8] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[9] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[10] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[11] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[12] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[13] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[14] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[15] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[16] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[17] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[18] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[19] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[20] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[21] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[22] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[23] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[24] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[25] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[26] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[27] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[28] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[29] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[30] decimal
radix signal  sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[31] decimal

run -all
