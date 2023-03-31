quit -sim
file delete -force work

vlib work
vlog -f files_rtl.f

vsim processor_tb
log -r /*

add wave -position end -group control -color #ff0000 -label clock sim:/processor_tb/clk
add wave -position end -group control -color #ff0000 -label reset sim:/processor_tb/rst

add wave -position end -group debug -color #ffff00 -label Stall sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/stall
add wave -position end -group debug -color #ffff00 -label "Take Brnch" sim:/processor_tb/proc_module/ex_mem_take_branch
add wave -position end -radix hexadecimal -group debug -color #ffff00 -label "Target" sim:/processor_tb/proc_module/ex_mem_target_PC

add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label fetch sim:/processor_tb/if_PC_out
add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label decode sim:/processor_tb/if_id_PC
add wave -position end -radix hexadecimal -group "Current Program Counter" -color #ffa500 -label execute sim:/processor_tb/id_ex_PC

add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label fetch sim:/processor_tb/if_IR_out
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label decode sim:/processor_tb/if_id_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label execute sim:/processor_tb/id_ex_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label memory sim:/processor_tb/ex_mem_IR
add wave -position end -radix hexadecimal -group Instructions -color #00ff00 -label "write back" sim:/processor_tb/mem_wb_IR

add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label fetch sim:/processor_tb/if_valid_inst_out
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label decode sim:/processor_tb/if_id_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label execute sim:/processor_tb/id_ex_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label memory sim:/processor_tb/ex_mem_valid_inst
add wave -position end -radix hexadecimal -group "Valid Instruction" -color #ffffff -label "write back" sim:/processor_tb/mem_wb_valid_inst

add wave -position end -radix hexadecimal -group "Next Program Counter" -color #964b00 -label fetch sim:/processor_tb/if_NPC_out
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #964b00 -label decode sim:/processor_tb/if_id_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #964b00 -label execute sim:/processor_tb/id_ex_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #964b00 -label memory sim:/processor_tb/ex_mem_NPC
add wave -position end -radix hexadecimal -group "Next Program Counter" -color #964b00 -label "write back" sim:/processor_tb/mem_wb_NPC


add wave -position end -radix decimal -color #00ffff -group "Reserved Registers" -label "x0 | zero" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[0]
add wave -position end -radix decimal -color #00ffff -group "Reserved Registers" -label "x1 | ra: Return Adress" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[1]
add wave -position end -radix decimal -color #00ffff -group "Reserved Registers" -label "x2 | sp: Stack Pointer" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[2]
add wave -position end -radix decimal -color #00ffff -group "Reserved Registers" -label "x3 | gp: Global Pointer" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[3]
add wave -position end -radix decimal -color #00ffff -group "Reserved Registers" -label "x4 | tp: Thread Pointer" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[4]

add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x10 | a0: Return Vaule 0" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[10]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x11 | a1: Return Vaule 1" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[11]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x12 | a2:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[12]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x13 | a3:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[13]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x14 | a4:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[14]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x15 | a5:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[15]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x16 | a6:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[16]
add wave -position end -radix decimal -color #0000ff -group "Function Arguments" -label "x17 | a7:" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[17]

add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x8 | s0 | fp: Frame Pointer" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[8]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x9 | s1" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[9]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x18 | s2" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[18]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x19 | s3" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[19]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x20 | s4" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[20]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x21 | s5" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[21]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x22 | s6" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[22]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x23 | s7" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[23]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x24 | s8" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[24]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x25 | s9" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[25]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x26 | s10" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[26]
add wave -position end -radix decimal -color #a020f0 -group "Saved Registers" -label "x27 | s11" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[27]

add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x5 | t0" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[5]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x6 | t1" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[6]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x7 | t2" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[7]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x28 | t3" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[28]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x29 | t4" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[29]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x30 | t5" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[30]
add wave -position end -radix decimal -color #808080 -group "Temporary Registers" -label "x31 | t6" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers[31]

add wave -position end -radix decimal -group "Data Memory" -color #ff00ff -label "Memory" -expand sim:/processor_tb/DM/unified_memory

run -all

wave zoom range 0ps 100ps

./main32.exe