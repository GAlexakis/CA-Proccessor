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
add wave -position end -group debug -color #ffff00 -label Stall sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/stall

add wave -position end -group "forwarding from ex" -color #ffff00 -label "to rA" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/ra_forward_from_ex_stage
add wave -position end -group "forwarding from ex" -color #ffff00 -label "to rB" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rb_forward_from_ex_stage
add wave -position end -group "forwarding from mem" -color #ffff00 -label "to rA" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/ra_forward_from_mem_stage
add wave -position end -group "forwarding from mem" -color #ffff00 -label "to rB" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rb_forward_from_mem_stage
add wave -position end -group "forwarding from wb" -color #ffff00 -label "to rA" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/ra_forward_from_wb_stage
add wave -position end -group "forwarding from wb" -color #ffff00 -label "to rB" sim:/processor_tb/proc_module/id_stage_0/hazard_detector_0/rb_forward_from_wb_stage

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


add wave -position end -radix decimal -color #00ffff -group "Registers" -label "regs" sim:/processor_tb/proc_module/id_stage_0/regf_0/registers

add wave -position end -radix decimal -group "Data Memory" -color #ff00ff -label "Memory" -expand sim:/processor_tb/DM/unified_memory

run -all

wave zoom range 0ps 100ps

./produce32.exe
./compare32.exe