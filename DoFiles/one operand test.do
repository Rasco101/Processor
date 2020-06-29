add wave -position insertpoint  \
sim:/processor/reg_fileFX/rData sim:/processor/ID_inst sim:/processor/ID_RegWrt1 sim:/processor/ID_RegWrt2 sim:/processor/ID_inst sim:/processor/ID_R1 sim:/processor/ID_R2 sim:/processor/reg_fileFX/OutR1 sim:/processor/reg_fileFX/OutR2 sim:/processor/reg_fileFX/R1 sim:/processor/reg_fileFX/R2 sim:/processor/ID_Imm sim:/processor/ALUFunc sim:/processor/ALUOp1 sim:/processor/ALUOp2 sim:/processor/ID_Imm sim:/processor/EXC_F sim:/processor/MEM_F sim:/processor/MEM_R2 sim:/processor/WB_F sim:/processor/WB_R2 sim:/processor/WB_Rd sim:/processor/WB_Rd2 sim:/processor/WB_RegWrt1 sim:/processor/WB_RegWrt2 sim:/processor/ZF sim:/processor/CF sim:/processor/NF 
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
force -freeze sim:/processor/InstMemoryFX/RAM(19) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(20) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(21) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(22) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(23) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(24) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(25) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(26) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(27) 1010100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(28) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(29) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(30) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(31) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(32) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(33) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(34) 0000000000000101 0
force -freeze sim:/processor/InstMemoryFX/RAM(35) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(36) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(37) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(38) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(39) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(40) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(41) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(42) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(43) 0000100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(44) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(45) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(46) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(47) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(48) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(49) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(50) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(51) 0011100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(52) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(53) 0011100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(54) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(55) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(56) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(57) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(58) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(59) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(60) 0000000000000101 0
force -freeze sim:/processor/InstMemoryFX/RAM(61) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(62) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(63) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(64) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(65) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(66) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(67) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(68) 0000000000001000 0
force -freeze sim:/processor/InstMemoryFX/RAM(69) 0000100000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(70) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(71) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(72) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(73) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(74) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(75) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(76) 0000000000001001 0
force -freeze sim:/processor/InstMemoryFX/RAM(77) 0000100100000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(78) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(79) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(80) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(81) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(82) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(83) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(84) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(85) 0011000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(86) 0000000000000000 0
force -freeze sim:/processor/InstMemoryFX/RAM(87) 0011000100000000 0
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