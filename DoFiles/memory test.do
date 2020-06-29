add wave -position insertpoint  \
sim:/processor/CLK sim:/processor/RST_tt sim:/processor/reg_fileFX/rData sim:/processor/IF_Inst sim:/processor/ID_MemWrt sim:/processor/ID_RegWrt1 sim:/processor/ID_SP sim:/processor/ID_Imm sim:/processor/ID_R1 sim:/processor/EXC_MemWrt sim:/processor/EXC_RegWrt1 sim:/processor/EXC_SP sim:/processor/EXC_Rd sim:/processor/EXC_R1 sim:/processor/EXC_F sim:/processor/EXC_Imm sim:/processor/MEM_MemOut sim:/processor/MEM_MemWrt sim:/processor/MEM_RegWrt1 sim:/processor/MEM_SP sim:/processor/MemAddMux sim:/processor/MEM_F sim:/processor/WB_RegWrt1 sim:/processor/WB_Rd sim:/processor/WB_F 
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/RST_tt 1 0
run
force -freeze sim:/processor/RST_tt 0 0
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
force -freeze sim:/processor/InstMemoryFX/RAM(23) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(24) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(25) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(26) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(27) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(28) 0001111010100000 0
force -freeze sim:/processor/InstMemoryFX/RAM(29) 0101000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(30) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(31) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(32) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(33) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(34) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(35) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(36) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(37) 0100000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(38) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(39) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(40) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(41) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(42) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(43) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(44) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(45) 0100000100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(46) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(47) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(48) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(49) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(50) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(51) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(52) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(53) 0100100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(54) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(55) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(56) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(57) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(58) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(59) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(60) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(61) 0100100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(62) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(63) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(64) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(65) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(66) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(67) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(68) 0000001000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(69) 0110000100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(70) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(71) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(72) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(73) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(74) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(75) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(76) 0000001000000010 0
force -freeze sim:/processor/InstMemoryFX/RAM(77) 0110000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(78) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(79) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(80) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(81) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(82) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(83) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(84) 0000001000000010 0
force -freeze sim:/processor/InstMemoryFX/RAM(85) 0101101000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(86) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(87) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(88) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(89) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(90) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(91) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(92) 0000001000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(93) 0101101100000000 0
force -freeze sim:/processor/PortInput 32'h0CDAFE19 0
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
force -freeze sim:/processor/PortInput 32'hffff 0
run
force -freeze sim:/processor/PortInput 32'hf320 0
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