add wave -position insertpoint  \
sim:/processor/CLK sim:/processor/RST_tt sim:/processor/reg_fileFX/rData sim:/processor/IF_Inst sim:/processor/ID_inst sim:/processor/ID_RegWrt1 sim:/processor/ID_RegWrt2 sim:/processor/ID_inst sim:/processor/ID_R1 sim:/processor/ID_R2 sim:/processor/reg_fileFX/OutR1 sim:/processor/reg_fileFX/OutR2 sim:/processor/reg_fileFX/R1 sim:/processor/reg_fileFX/R2 sim:/processor/ID_Imm sim:/processor/ALUFunc sim:/processor/ALUOp1 sim:/processor/ALUOp2 sim:/processor/ID_Imm sim:/processor/EXC_F sim:/processor/MEM_F sim:/processor/MEM_R2 sim:/processor/WB_F sim:/processor/WB_R2 sim:/processor/WB_Rd sim:/processor/WB_Rd2 sim:/processor/WB_RegWrt1 sim:/processor/WB_RegWrt2 sim:/processor/ZF sim:/processor/CF sim:/processor/NF 
add wave -position insertpoint  \
sim:/processor/PortInput \
sim:/processor/PortOutput
add wave -position insertpoint  \
sim:/processor/WB_PortIn \
sim:/processor/WB_PortOut
force -freeze sim:/processor/PortInput 32'h5 0
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/rst 1 0
run
force -freeze sim:/processor/rst 0 0
force -freeze sim:/processor/InstMemoryFX/RAM(0) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(1) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(2) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(3) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(4) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(5) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(6) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(7) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(8) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(9) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(10) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(11) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(12) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(13) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(14) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(15) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(16) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(17) 1010000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(18) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(19) 1010100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(20) 0000000000000101 0
force -freeze sim:/processor/InstMemoryFX/RAM(21) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(22) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(23) 0000100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(24) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(25) 0011100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(26) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(27) 0011100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(28) 0000000000000101 0
force -freeze sim:/processor/InstMemoryFX/RAM(29) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(30) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(31) 0000100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(32) 0000000000001001 0
force -freeze sim:/processor/InstMemoryFX/RAM(33) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(34) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(35) 0011000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(36) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(37) 0011000100000000 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/processor/PortInput 32'h10 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run