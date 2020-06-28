library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY Processor IS
    PORT(   CLK, RST_tt, INT: IN std_logic;
        PortInput: IN std_logic_vector(31 downto 0);
        PortOutput: OUT std_logic_vector(31 downto 0) );
END Processor;


architecture Processor_imp of processor is
    COMPONENT PC_Reg IS
        PORT( clk, rst, Latch, stall    : IN  std_logic;
            PCIn   : IN  std_logic_vector(10 DOWNTO 0);
            PCOut  : OUT std_logic_vector(10 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT InstMemory is
        PORT(
            clk, rst:IN std_logic;
            instAddress:IN std_logic_vector(10 downto 0);
            instDataOut: OUT std_logic_vector(31 downto 0);
            instMemWrt: IN std_logic:='0' 
        );
    END COMPONENT;
    
    COMPONENT PC_Adder IS
        PORT(
            PCAdderIn  : IN  std_logic_vector(10 downto 0);
            PCAdderOut : OUT std_logic_vector(10 downto 0)
        );
    END COMPONENT;

    COMPONENT PCLatchSignals IS
        PORT (
            Mem_RET, Mem_RTI, CALL, IsBranching: IN std_logic;
            PC_Latch: OUT std_logic 
        );
    END COMPONENT;

    SIGNAL PCIn, IF_PC: std_logic_vector(10 downto 0);
    SIGNAL Latch, PC_stall: std_logic;
    SIGNAL IF_Inst: std_logic_vector(31 downto 0);
                    -- ///////     IF_ID_REG   ////// --
    COMPONENT IF_ID_Register IS
        PORT( 
            clk,rst_temp, stall : IN std_logic;
            -- To ID Stage
            -- IN
            IF_Inst: IN std_logic_vector(31 downto 0);
            --OUT
            ID_Inst: OUT std_logic_vector(31 downto 0);
            -- Public
            --IN
            IF_PC: IN std_logic_vector(10 downto 0);
            --OUT
            ID_PC: OUT std_logic_vector(10 downto 0)
        );
    END COMPONENT;
                    -- ///////     IF_ID_REG   ////// --

    -------------------- ID MAIN COMPONENT -------------------------
    COMPONENT reg_file IS
        PORT (
          clk, rst, regWrt1, regWrt2: IN std_logic;
          R1, R2, Rdest1, Rdest2: IN std_logic_vector(2 downto 0);
          DWrite1, DWrite2:   IN std_logic_vector(31 downto 0) ;
          OutR1, OutR2:   OUT std_logic_vector(31 downto 0) 
        ) ;
    END COMPONENT;
	
	--reg_fileFX: reg_file PORT MAP(clk, rst, WB_RegWrt1(0), WB_RegWrt2(0), 
    --    Src1Mux, Src2Mux, ID_Inst(26 DOWNTO 24), Src1Mux, DWrite1, WB_R2, ID_R1, ID_R2);
    
    COMPONENT ControlUnit IS
        PORT(InstructionOpcode : in std_logic_vector(4 downto 0);
        SPcontrol : out std_logic_vector(1 downto 0);
        RegDst1, RegDst2, ALUSrc, MemtoReg, RegWrite1, RegWrite2, ALUsrcLDM, MemWrite, BranchEqual,
        BranchNegative, BranchCarry, Branch, ALUEn,
        OUTsignal, INsignal, RETsignal, RTIsignal, CALLsignal, SETC, CLRC: out std_logic
        ); 
    END COMPONENT;
    
    COMPONENT ZeroExtend1632 IS 
	    PORT (
            original : IN std_logic_vector (15 DOWNTO 0);
			extended : OUT std_logic_vector (31 DOWNTO 0));
    END COMPONENT;

    SIGNAL IF_ID_STALL, RegDst1, RegDst2, JZ, JN, JC, JMP: std_logic;
    SIGNAL  ID_ALUEn, ID_ALUSrc, ID_ALUSrcLDM, ID_SETC, ID_CLRC, ID_MemWrt, ID_CALL, ID_RET, ID_RTI,
            ID_MemToReg, ID_PortIn, ID_PortOut, ID_RegWrt1, ID_RegWrt2: std_logic_vector(0 downto 0);
    SIGNAL ID_SP: std_logic_vector(1 downto 0);
    SIGNAL ID_inst, ID_R1, ID_R2, ID_Imm: std_logic_vector(31 downto 0);
    SIGNAL Src1Mux, Src2Mux: std_logic_vector(2 downto 0);
    SIGNAL ID_PC: std_logic_vector(10 downto 0);
                -- ///////     ID_EXC_REG   ////// --
    COMPONENT ID_EX_Register IS
        PORT(
            --Reg Signals
            clk, rst, stall: IN std_logic;
    
            --To Exec Stage
            --IN
            ID_ALUEn, ID_ALUSrc, ID_ALUSrcLDM, ID_SETC, ID_CLRC: IN std_logic_vector(0 downto 0);
            --OUT
            EXC_ALUEn, EXC_ALUSrc, EXC_ALUSrcLDM, EXC_SETC, EXC_CLRC: OUT std_logic_vector(0 downto 0);
            
            -- To Mem Stage
            --IN
            ID_MemWrt, ID_CALL, ID_RET, ID_RTI: IN std_logic_vector(0 downto 0);
            ID_SP: IN std_logic_vector(1 downto 0);
            --OUT
            EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI: OUT std_logic_vector(0 downto 0);
            EXC_SP: OUT std_logic_vector(1 downto 0);
            
            -- To WB Stage
            --IN
            ID_MemToReg, ID_PortIn, ID_PortOut, ID_RegWrt1, ID_RegWrt2: IN std_logic_vector(0 downto 0);
            --OUT
            EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2: OUT std_logic_vector(0 downto 0);
            
            -- Public
            --IN
            ID_R1, ID_R2, ID_Imm: IN std_logic_vector(31 downto 0);
            ID_Rs, ID_Rt, ID_Rd, ID_Rd2: IN std_logic_vector(2 downto 0);
            ID_EA, ID_PC: IN std_logic_vector(10 downto 0);
            ID_Func: IN std_logic_vector(3 downto 0);
            --OUT
            EXC_R1, EXC_R2, EXC_Imm: OUT std_logic_vector(31 downto 0);
            EXC_Rs, EXC_Rt, EXC_Rd, EXC_Rd2: OUT std_logic_vector(2 downto 0);
            EXC_EA, EXC_PC: OUT std_logic_vector(10 downto 0);
            EXC_Func: OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;               
                    -- ///////     ID_EXC_REG   ////// --
    -------------------- EXC MAIN COMPONENT -------------------------
    COMPONENT ALU IS
        PORT(
            clk, rst:   IN std_logic;
            A, B:       IN std_logic_vector(31 downto 0);
            sel:        IN std_logic_vector(3 downto 0);
            F:          OUT std_logic_vector(31 downto 0);
            CF, ZF, NF: OUT std_logic:= '0'  
        );
    END COMPONENT;

    COMPONENT ALUControlUnit IS
        PORT(
            ALUEn : in std_logic_vector(0 downto 0);
            FunctionField : in std_logic_vector(3 downto 0);
            ALUControlInput : out std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    COMPONENT FlagsRegister IS
        PORT( 
            clk, rst, stall, SETC, CLRC : IN std_logic;
            ZFin,NFin,CFin : IN std_logic;
            ZFout,NFout,CFout : OUT std_logic
        );
    END COMPONENT;

    COMPONENT ForwardUnit IS
        PORT(
            EX_MEM_RegWrite,MEM_WB_RegWrite : in std_logic;
            EX_MEM_Rdst,ID_EX_RS,ID_EX_RT,MEM_WB_RD : in std_logic_vector(2 downto 0);
            RS_Forward,RT_Forward: out std_logic_vector(1 downto 0)
        );
    END COMPONENT;

    SIGNAL ID_EXC_STALL: std_logic:='0';
    SIGNAL  EXC_ALUEn, EXC_ALUSrc, EXC_ALUSrcLDM, EXC_SETC, EXC_CLRC, EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI,
            EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2: std_logic_vector(0 downto 0);
    SIGNAL CF, NF, ZF, CFOut, NFOut, ZFOut: std_logic; -- OUTPUT OF ALU & INPUT TO FLAGS REG
    SIGNAL EXC_SP, RS_Forward, RT_Forward: std_logic_vector(1 downto 0);
    SIGNAL EXC_R1, EXC_R2, EXC_Imm, ALUSrcLDMMux, ALUSrcMux, ALUOp1, 
            ALUOp2, EXC_F: std_logic_vector(31 downto 0);
    SIGNAL EXC_Rs, EXC_Rt, EXC_Rd, EXC_Rd2: std_logic_vector(2 downto 0);
    SIGNAL EXC_EA, EXC_PC: std_logic_vector(10 downto 0);
    SIGNAL EXC_Func, ALUFunc: std_logic_vector(3 downto 0);
                    -- ///////     EXC_MEM_REG   ////// --
    COMPONENT EX_MEM_Register IS
        PORT(
            --Reg Signals
            clk, rst, stall: IN std_logic;
            -- To Mem Stage
            --IN
            EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI: IN std_logic_vector(0 downto 0);
            EXC_SP: IN std_logic_vector(1 downto 0);
            --OUT
            MEM_MemWrt, MEM_CALL, MEM_RET, MEM_RTI: OUT std_logic_vector(0 downto 0);
            MEM_SP: OUT std_logic_vector(1 downto 0);
            
            -- To WB Stage
            --IN
            EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2: IN std_logic_vector(0 downto 0);
            --OUT
            MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2: OUT std_logic_vector(0 downto 0);
            
            -------------- Public
            --IN
            EXC_F, EXC_R2: IN std_logic_vector(31 downto 0);
            EXC_Rd, EXC_Rd2: IN std_logic_vector(2 downto 0);
            EXC_EA, EXC_PC: IN std_logic_vector(10 downto 0);
            --OUT
            MEM_F, MEM_R2: OUT std_logic_vector(31 downto 0);
            MEM_Rd, MEM_Rd2: OUT std_logic_vector(2 downto 0);
            MEM_EA, MEM_PC: OUT std_logic_vector(10 downto 0)
        );  
    END COMPONENT;
                    -- ///////     EXC_MEM_REG   ////// --
    -------------------- MEM MAIN COMPONENT -------------------------
    COMPONENT DataMemory is
        PORT(
            clk, rst, en: IN std_logic;
            dataAddress: IN std_logic_vector(10 downto 0);
            dataDataOut: OUT std_logic_vector(31 downto 0);
            dataDataIn: IN std_logic_vector(31 downto 0);
            dataMemWrt: IN std_logic -- Works As Enable in case of stall
        );
    END COMPONENT;

    COMPONENT MemPCAdder IS
        PORT(
            Mem_PC_IN: IN std_logic_vector(10 downto 0);
            Mem_PC_OUT: OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;


    SIGNAL EXC_MEM_STALL: std_logic:='0';
    SIGNAL MEM_MemWrt, MEM_CALL, MEM_RET, MEM_RTI, MEM_MemToReg, MEM_PortIn, MEM_PortOut,
        MEM_RegWrt1, MEM_RegWrt2: std_logic_vector(0 downto 0);
    SIGNAL MEM_SP: std_logic_vector(1 downto 0);
    SIGNAL MEM_F, MEM_R2, MemDataMux, Mem_PC_OUT, MEM_MemOut: std_logic_vector(31 downto 0);
    SIGNAL MEM_Rd, MEM_Rd2: std_logic_vector(2 downto 0);
    SIGNAL MEM_EA, MEM_PC, SPAddress, MemAddMux: std_logic_vector(10 downto 0);
                    -- ///////     MEM_WB_REG   ////// --
        COMPONENT MEM_WB_Register IS
            PORT( 
            clk, rst, stall: IN std_logic;
            -- To WB Stage
            --IN
            MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2: IN std_logic_vector(0 downto 0);
            --OUT
            WB_MemToReg, WB_PortIn, WB_PortOut, WB_RegWrt1, WB_RegWrt2: OUT std_logic_vector(0 downto 0);
            -------------- Public
            --IN
            MEM_MemOut, MEM_R2, MEM_F: IN std_logic_vector(31 downto 0);
            MEM_Rd, MEM_Rd2: IN std_logic_vector(2 downto 0);
            --OUT
            WB_MemOut, WB_R2, WB_F: OUT std_logic_vector(31 downto 0);
            WB_Rd, WB_Rd2: OUT std_logic_vector(2 downto 0)
            );
        END COMPONENT;
                    -- ///////     MEM_WB_REG   ////// --
    -------------------- WB MAIN COMPONENT -------------------------
    SIGNAL MEM_WB_STALL: std_logic:='0';
    SIGNAL WB_MemToReg, WB_PortIn, WB_PortOut, WB_RegWrt1, WB_RegWrt2: std_logic_vector(0 downto 0);
    SIGNAL WB_MemOut, WB_R2, WB_F, MemToRegMux, DWrite1, PortOut: std_logic_vector(31 downto 0);
    SIGNAL WB_Rd, WB_Rd2: std_logic_vector(2 downto 0);

    -------------------- PUBLIC COMPONENT -------------------------
    COMPONENT JumpTypeDetectionUnit IS
        PORT(
            ZF,NF,CF : in std_logic;
            BEQ,BN,BC,B : in std_logic;
            isBranching : out std_logic
        );
    END COMPONENT;

    COMPONENT MUX21 IS 
        Generic ( n : Integer:=3);
        PORT ( 
            in0,in1 : IN std_logic_vector (n-1 DOWNTO 0);
            sel : IN  std_logic;
            out1 : OUT std_logic_vector (n-1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT MUX41 IS 
        Generic ( n : Integer:=32);
        PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
            sel : IN  std_logic_vector (1 DOWNTO 0);
            out1 : OUT std_logic_vector (n-1 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL isBranching, RETMUXSel, IF_ID_RST, ID_EXC_RST, EXC_MEM_RST: std_logic;
    SIGNAL PCAdderOut, RegAdderOutMux, CALLMux: std_logic_vector(10 downto 0);  
    SIGNAL ApplyBranching, PCLatch: std_logic;
    SIGNAL rst: std_logic:='0';

BEGIN
        rst <= RST_tt;
            --- IF STAGE INTERCONNECTIONS ---
    
    PCFX: PC_Reg PORT MAP(clk, rst, Latch, '0', PCIn, IF_PC);
    InstMemoryFX:  InstMemory PORT MAP(clk, rst, IF_PC, IF_Inst, '0');
    PC_AdderFX: PC_Adder PORT MAP(IF_PC, PCAdderOut);
    PCLatchSignalsFX: PCLatchSignals PORT MAP(MEM_RET(0), Mem_RTI(0), MEM_CALL(0), isBranching, Latch);

            --- IF_ID REGISTER INTERCONNECTIONS ---
    IF_ID_RST <= rst OR MEM_CALL(0) or MEM_RET(0) OR MEM_RTI(0);
    IF_ID_RegisterFX: IF_ID_Register PORT MAP(clk, IF_ID_RST, '0', IF_Inst, ID_Inst, IF_PC, ID_PC);
    
            --- ID STAGE INTERCONNECTIONS ---
    reg_fileFX: reg_file PORT MAP(clk, rst, WB_RegWrt1(0), WB_RegWrt2(0), 
        Src1Mux, Src2Mux, WB_Rd, WB_Rd2, DWrite1, WB_R2, ID_R1, ID_R2);
    ControlUnitFX: ControlUnit PORT MAP(ID_Inst(31 DOWNTO 27), ID_SP, RegDst1, RegDst2, 
        ID_ALuSrc(0), ID_MemToReg(0), ID_RegWrt1(0), ID_RegWrt2(0), ID_ALUSrcLDM(0), ID_MemWrt(0),
        JZ, JN, JC, JMP, ID_ALUEn(0), ID_PortOut(0), ID_PortIn(0), ID_RET(0), ID_RTI(0), ID_CALL(0), ID_SETC(0), ID_CLRC(0)); 
    ZeroExtend1632FX: ZeroExtend1632 PORT MAP(ID_Inst(20 DOWNTO 5), ID_Imm);
    Src1MUXFX: MUX21 GENERIC MAP(3) PORT MAP(ID_Inst(23 downto 21), ID_Inst(26 downto 24), RegDst1, Src1Mux);
    Src2MUXFX: MUX21 GENERIC MAP(3) PORT MAP(ID_Inst(20 downto 18), ID_Inst(26 downto 24), RegDst2, Src2Mux);
    

            --- ID_EXC REGISTER INTERCONNECTIONS ---
    ID_EXC_RST <= rst OR MEM_CALL(0) or MEM_RET(0) OR MEM_RTI(0);
    ID_EXC_RegisterFX: ID_EX_Register PORT MAP(clk, ID_EXC_RST, '0', ID_ALUEn, ID_ALUSrc, ID_ALUSrcLDM, ID_SETC, ID_CLRC,
        EXC_ALUEn, EXC_ALUSrc, EXC_ALUSrcLDM, EXC_SETC, EXC_CLRC,
        ID_MemWrt, ID_CALL, ID_RET, ID_RTI, ID_SP,
        EXC_MemWrt, EXC_CALL, EXC_RET, EXC_RTI, EXC_SP,
        ID_MemToReg, ID_PortIn, ID_PortOut, ID_RegWrt1, ID_RegWrt2,
        EXC_MemToReg, EXC_PortIn, EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2,
        ID_R1, ID_R2, ID_Imm, ID_Inst(23 DOWNTO 21), ID_Inst(20 DOWNTO 18), ID_Inst(26 DOWNTO 24), Src1MUX, 
        ID_Inst(10 DOWNTO 0), ID_PC, ID_Inst(3 DOWNTO 0),
        EXC_R1, EXC_R2, EXC_Imm, EXC_Rs, EXC_Rt, EXC_Rd, EXC_Rd2, EXC_EA, EXC_PC,
        EXC_Func);

            --- EXC STAGE INTERCONNECTIONS ---
    ALUFX: ALU PORT MAP(clk, rst, ALUOp1, ALUOp2, ALUFunc, EXC_F, CF, ZF, NF);
    ALUControlUnitFX: ALUControlUnit PORT MAP(EXC_ALUEn, EXC_Func, ALUFunc);
    FlagsRegisterFX: FlagsRegister PORT MAP(clk, rst, '0', EXC_SETC(0), EXC_CLRC(0), ZF, NF, CF,
        ZFOut, NFOut, CFOut);
    ForwardUnitFX: ForwardUnit PORT MAP(MEM_RegWrt1(0), WB_RegWrt1(0), MEM_Rd, EXC_Rs, EXC_Rt, WB_Rd,
        RS_Forward, RT_Forward);
    OP1MUXFX: MUX21 GENERIC MAP(32) PORT MAP(EXC_R1, EXC_Imm, EXC_ALUSrcLDM(0), ALUOp1);
    OP2MUXFX: MUX21 GENERIC MAP(32) PORT MAP(EXC_R2, EXC_Imm, EXC_ALUSrc(0), ALUOp2);
    --RSMUXFX: MUX41 GENERIC MAP(32) PORT MAP(ALUSrcLDMMux, DWrite1, MEM_F, ALUSrcLDMMux, RS_Forward, ALUOp1);
    --RTMUXFX: MUX41 GENERIC MAP(32) PORT MAP(ALUSrcMux, DWrite1, MEM_F, ALUSrcMux, RS_Forward, ALUOp2);

            --- EXC_MEM REGISTER -- 
    EXC_MEM_REGFX: EX_MEM_Register PORT MAP(clk ,rst , EXC_MEM_STALL, EXC_MemWrt, EXC_CALL, EXC_RET, 
        EXC_RTI, EXC_SP, MEM_MemWrt, MEM_CALL, MEM_RET, MEM_RTI, MEM_SP, EXC_MemToReg, EXC_PortIn,
        EXC_PortOut, EXC_RegWrt1, EXC_RegWrt2,MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2,
        EXC_F, EXC_R2, EXC_Rd, EXC_Rd2, EXC_EA, EXC_PC, 
        MEM_F, MEM_R2, MEM_Rd, MEM_Rd2, MEM_EA, MEM_PC);
    
            --- MEM STAGE INTERCONNECTIONS ---
    DataMemoryFX: DataMemory PORT MAP(clk, rst, MEM_SP(0), MemAddMux, MEM_MemOut, MemDataMux, MEM_MemWrt(0));
    MemPCAdderFX: MemPCAdder PORT MAP(MEM_PC, Mem_PC_OUT);
    MEMDataMUXFX: MUX21 GENERIC MAP(32) PORT MAP(MEM_F, Mem_PC_OUT, MEM_CALL(0), MemDataMux);
    MEMAddMUXFX: MUX21  GENERIC MAP(11) PORT MAP(MEM_EA, SPAddress, MEM_SP(0), MemAddMux);
    
            --- MEM_WB REGISTER ---
    MEM_WB_RegisterFX: MEM_WB_Register PORT MAP(clk ,rst, MEM_WB_STALL, 
        MEM_MemToReg, MEM_PortIn, MEM_PortOut, MEM_RegWrt1, MEM_RegWrt2, 
        WB_MemToReg, WB_PortIn, WB_PortOut, WB_RegWrt1, WB_RegWrt2,
        MEM_MemOut, MEM_R2, MEM_F, MEM_Rd, MEM_Rd2,
        WB_MemOut, WB_R2, WB_F, WB_Rd, WB_Rd2);

            --- WB STAGE INTERCONNECTIONS ---
    MEMToRegMUXFX: MUX21 GENERIC MAP(32) PORT MAP(WB_F, WB_MemOut, WB_MemToReg(0), MemToRegMux);
    PORToRegMUXFX: MUX21 GENERIC MAP(32) PORT MAP(MemToRegMux, PortOut, WB_PortIn(0), DWrite1);

            --- PUBLIC INTERCONNECTIONS ---
    JumpTypeDetectionUnitFX: JumpTypeDetectionUnit PORT MAP(ZF, NF, CF, JZ, JN, JC, JMP, isBranching);
    BranchingMUXFX: MUX21 GENERIC MAP(11) PORT MAP(PCAdderOut, ID_R1(10 downto 0), isBranching, RegAdderOutMux);
    CALLMUXFX: MUX21 GENERIC MAP(11) PORT MAP(RegAdderOutMux, MEM_F(10 DOWNTO 0), MEM_CALL(0), CALLMux);
    RETMUXSel <= MEM_RET(0) OR MEM_RTI(0);
    RETMUXFX: MUX21 GENERIC MAP(11) PORT MAP(CALLMux, MEM_MemOut(10 DOWNTO 0), RETMUXSel, PCIn);
    
    PROCESS(IF_ID_RST) BEGIN
        IF isBranching = '1' THEN
            ApplyBranching <= '1';
        END IF;
    END PROCESS;
    PROCESS(clk) BEGIN
        IF WB_PortIn = "1" THEN 
            PortOut <= PortInput;
        END IF;
        IF WB_PortOut = "1" THEN
            PortOutput <= WB_F;
        END IF;
    END PROCESS;

end architecture Processor_imp;