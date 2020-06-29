add wave -position insertpoint  \
sim:/processor/CLK sim:/processor/RST_tt sim:/processor/reg_fileFX/rData sim:/processor/IF_Inst sim:/processor/ID_inst sim:/processor/ID_SETC sim:/processor/ID_CLRC sim:/processor/ID_ALUEn sim:/processor/ID_JC sim:/processor/ID_JN sim:/processor/ID_JZ sim:/processor/ID_MemWrt sim:/processor/ID_PortIn sim:/processor/ID_PortOut sim:/processor/ID_RegWrt1 sim:/processor/ID_SETC sim:/processor/ID_SP sim:/processor/reg_fileFX/R1 sim:/processor/reg_fileFX/R2 sim:/processor/reg_fileFX/OutR1 sim:/processor/reg_fileFX/OutR2 sim:/processor/ID_Imm sim:/processor/ALUOp1 sim:/processor/ALUOp2 sim:/processor/EXC_Func sim:/processor/EXC_F sim:/processor/CF sim:/processor/ZF sim:/processor/NF sim:/processor/EXC_RC sim:/processor/EXC_RN sim:/processor/EXC_RZ sim:/processor/EXC_Imm sim:/processor/EXC_PortIn sim:/processor/EXC_PortOut sim:/processor/EXC_RegWrt1 sim:/processor/EXC_RegWrt2 sim:/processor/EXC_SETC sim:/processor/EXC_SP sim:/processor/MEM_SP sim:/processor/MEM_MemWrt sim:/processor/MemAddMux sim:/processor/MEM_F sim:/processor/MemDataMux sim:/processor/MEM_MemOut sim:/processor/WB_F sim:/processor/WB_MemToReg sim:/processor/WB_PortIn sim:/processor/WB_PortOut sim:/processor/WB_Rd sim:/processor/WB_Rd2 sim:/processor/WB_RegWrt1 sim:/processor/WB_RegWrt2 
add wave -position insertpoint  \
sim:/processor/PortInput \
sim:/processor/PortOutput
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/rst 1 0
force -freeze sim:/processor/PortInput 32'h30 0
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
force -freeze sim:/processor/InstMemoryFX/RAM(17) 0011100100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(18) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(19) 0011101000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(20) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(21) 0011101100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(22) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(23) 0011110000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(24) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(25) 0011111100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(26) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(27) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(28) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(29) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(30) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(31) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(32) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(33) 0100010000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(34) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(35) 1000000100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(36) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(37) 0000111100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(48) 0000000000000011 0
force -freeze sim:/processor/InstMemoryFX/RAM(49) 0001010100110100 0

force -freeze sim:/processor/InstMemoryFX/RAM(50) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(51) 0110101000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(52) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(53) 0000111100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(80) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(81) 0110100100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(82) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(83) 0111101100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(84) 0000000000000101 0
force -freeze sim:/processor/InstMemoryFX/RAM(85) 0000110100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(86) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(87) 0011111000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(88) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(89) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(90) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(91) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(92) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(93) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(94) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(95) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(96) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(97) 0111011000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(98) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(99) 0000100100000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(256) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(257) 1010100000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(258) 0000000000000011 0
force -freeze sim:/processor/InstMemoryFX/RAM(259) 0001000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(260) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(261) 0011011000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(262) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(263) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(264) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(265) 0100111000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(266) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(267) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(268) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(269) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(270) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(271) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(272) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(273) 0000000000000000 0

force -freeze sim:/processor/InstMemoryFX/RAM(274) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(275) 1000111100000000 0

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
force -freeze sim:/processor/PortInput 32'h50 0
run 
force -freeze sim:/processor/PortInput 32'h100 0
run 
force -freeze sim:/processor/PortInput 32'h300 0
run
force -freeze sim:/processor/PortInput 32'hFFFFFFFF 0
run
run
run
run
run
run
run
run
force -freeze sim:/processor/PortInput 32'h200 0
run 
run


 