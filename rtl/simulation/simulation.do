quit -sim
file delete -force work

vlib work
vlog -f files_rtl.f

vsim processor_tb
log -r /*

add wave -position end -group control -color #ff0000 -label clock sim:/processor_tb/clk
add wave -position end -group control -color #ff0000 -label reset sim:/processor_tb/rst

add wave -position end -group debug -color #ffff00 -label "Take Brnch" sim:/processor_tb/proc_module/ex_mem_take_branch
add wave -position end -radix hexadecimal -group debug -color #ffff00 -label "Target" sim:/processor_tb/proc_module/ex_mem_target_PC
add wave -position end -radix unsigned -group debug -color #ffff00 -label ra sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/ra_id
add wave -position end -radix unsigned -group debug -color #ffff00 -label rb sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rb_id
add wave -position end -radix unsigned -group debug -color #ffff00 -label rex sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rd_ex_id
add wave -position end -radix unsigned -group debug -color #ffff00 -label rmem sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rd_mem_id
add wave -position end -radix unsigned -group debug -color #ffff00 -label rwb sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rd_wb_id
add wave -position end -group debug -color #ffff00 -label Stall sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/stall

add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label fetch sim:/processor_tb/if_IR_out
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label decode sim:/processor_tb/if_id_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label execute sim:/processor_tb/id_ex_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label memory sim:/processor_tb/ex_mem_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label "write back" sim:/processor_tb/mem_wb_IR

add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label fetch sim:/processor_tb/if_PC_out
add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label decode sim:/processor_tb/if_id_PC
add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label execute sim:/processor_tb/id_ex_PC

add wave -position end -radix hexadecimal -group "Next Program Counter" -color #0000ff -label fetch sim:/processor_tb/if_NPC_out
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #0000ff -label decode sim:/processor_tb/if_id_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #0000ff -label execute sim:/processor_tb/id_ex_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #0000ff -label memory sim:/processor_tb/ex_mem_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #0000ff -label "write back" sim:/processor_tb/mem_wb_NPC

add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label fetch sim:/processor_tb/if_valid_inst_out
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label decode sim:/processor_tb/if_id_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label execute sim:/processor_tb/id_ex_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label memory sim:/processor_tb/ex_mem_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label "write back" sim:/processor_tb/mem_wb_valid_inst

add wave -position end -radix decimal -color #00ffff -group Registers -label x0 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[0]
add wave -position end -radix decimal -color #00ffff -group Registers -label x1 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[1]
add wave -position end -radix decimal -color #00ffff -group Registers -label x2 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[2]
add wave -position end -radix decimal -color #00ffff -group Registers -label x3 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[3]
add wave -position end -radix decimal -color #00ffff -group Registers -label x4 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[4]
add wave -position end -radix decimal -color #00ffff -group Registers -label x5 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[5]
add wave -position end -radix decimal -color #00ffff -group Registers -label x6 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[6]
add wave -position end -radix decimal -color #00ffff -group Registers -label x7 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[7]
add wave -position end -radix decimal -color #00ffff -group Registers -label x8 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[8]
add wave -position end -radix decimal -color #00ffff -group Registers -label x9 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[9]
add wave -position end -radix decimal -color #00ffff -group Registers -label x10 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[10]
add wave -position end -radix decimal -color #00ffff -group Registers -label x11 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[11]
add wave -position end -radix decimal -color #00ffff -group Registers -label x12 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[12]
add wave -position end -radix decimal -color #00ffff -group Registers -label x13 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[13]
add wave -position end -radix decimal -color #00ffff -group Registers -label x14 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[14]
add wave -position end -radix decimal -color #00ffff -group Registers -label x15 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[15]
add wave -position end -radix decimal -color #00ffff -group Registers -label x16 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[16]
add wave -position end -radix decimal -color #00ffff -group Registers -label x17 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[17]
add wave -position end -radix decimal -color #00ffff -group Registers -label x18 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[18]
add wave -position end -radix decimal -color #00ffff -group Registers -label x19 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[19]
add wave -position end -radix decimal -color #00ffff -group Registers -label x20 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[20]
add wave -position end -radix decimal -color #00ffff -group Registers -label x21 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[21]
add wave -position end -radix decimal -color #00ffff -group Registers -label x22 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[22]
add wave -position end -radix decimal -color #00ffff -group Registers -label x23 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[23]
add wave -position end -radix decimal -color #00ffff -group Registers -label x24 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[24]
add wave -position end -radix decimal -color #00ffff -group Registers -label x25 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[25]
add wave -position end -radix decimal -color #00ffff -group Registers -label x26 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[26]
add wave -position end -radix decimal -color #00ffff -group Registers -label x27 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[27]
add wave -position end -radix decimal -color #00ffff -group Registers -label x28 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[28]
add wave -position end -radix decimal -color #00ffff -group Registers -label x29 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[29]
add wave -position end -radix decimal -color #00ffff -group Registers -label x30 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[30]
add wave -position end -radix decimal -color #00ffff -group Registers -label x31 sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[31]

add wave -position end -radix decimal -group "Data Memory" -color #ff00ff -label "Memory" -expand sim:/processor_tb/DM/unified_memory
add wave -position end -radix hexadecimal -group "Instruction Memory" -color #7f00ff -label "Memory" -expand sim:/processor_tb/DM/unified_memory

run -all

wave zoom range 0ps 100ps
