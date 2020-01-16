---------------------------------------------------------------------------
-- University of Aveiro - DETI
-- "Computer Architecture I" course (Practical classes)
-- 
-- MIPS single-cycle datapath
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.DisplayUnit_pkg.all;
use work.MIPS_pkg.all;

entity MIPS_SingleCycle is
	port(	CLOCK_50 : in std_logic;
			KEY  		: in std_logic_vector(3 downto 0);
			SW   		: in std_logic_vector(17 downto 0);
			LEDR  	: out std_logic_vector(17 downto 0);
			LEDG  	: out std_logic_vector(8 downto 0);
			HEX0  	: out std_logic_vector(6 downto 0);
			HEX1  	: out std_logic_vector(6 downto 0);
			HEX2  	: out std_logic_vector(6 downto 0);
			HEX3  	: out std_logic_vector(6 downto 0);
			HEX4  	: out std_logic_vector(6 downto 0);
			HEX5  	: out std_logic_vector(6 downto 0);
			HEX6  	: out std_logic_vector(6 downto 0);
			HEX7  	: out std_logic_vector(6 downto 0));
end MIPS_SingleCycle;

architecture Shell of MIPS_SingleCycle is
-- Data signals
	signal sd_readData1 : std_logic_vector(31 downto 0);
	
-- Control signals (generated by the control unit)
	signal sc_RegDst : std_logic;

-- Signals related to the instruction code
	signal si_instr : std_logic_vector(31 downto 0);

-- Other signals
	signal s_clk : std_logic;
	signal s_pc : std_logic_vector(31 downto 0);
	signal s_jAddr : std_logic_vector(25 downto 0);
	signal s_offset : std_logic_vector(31 downto 0);

--Register Signals
	signal s_regrs, s_regrt, s_regrd	: std_logic_vector(4  downto 0);
	signal s_data1, s_data2				: std_logic_vector(31 downto 0);

--ALU Signals
	signal s_alufunct	:	std_logic_vector(5 downto 0);
	signal s_ALUout	:	std_logic_vector(31 downto 0);
	signal s_zero		:	std_logic;
	signal s_op			:	std_logic_vector(2 downto 0);
	
--Mux Signals
	signal s_outm1	:	std_logic_vector(4  downto 0);
	signal s_outm2	:	std_logic_vector(31 downto 0);
	
--Splitter Signals
	signal s_imm	: std_logic_vector(15 downto 0);
	
begin

-- PC Update
pcupd:	entity work.PCupdate(Behavioral)	
			port map(clk		=> s_clk,
						reset		=> not KEY(1),
						branch	=> '0',
						jump		=> '0',
						zero		=> s_zero,
						offset32	=> s_offset,
						jAddr26	=> s_jAddr,
						pc			=> s_pc);
						
	DU_PC <= s_pc;

-- Instruction Memory
instmem:	entity work.InstructionMemory(Behavioral)
			generic map(ADDR_BUS_SIZE => ROM_ADDR_SIZE)
			port map(address		=> s_pc(7 downto 2), 
						readData		=> si_instr);

-- Splitter
spliter:	entity work.InstrSplitter(Behavioral)
			port map(instruction	=> si_instr,
					--	opcode		=>
					-- shamt			=>	
						rs				=> s_regrs,
						rt				=> s_regrt,
						rd				=> s_regrd,
						funct			=> s_alufunct,
						imm			=> s_imm,
						jAddr			=> s_jAddr);
	
-- Sign Extender
signext:	entity work.SignExtend(Behavioral)
			port map(dataIn	=> s_imm,
						dataOut	=> s_offset);
	
--	DU_RFdata <= si_instr;	
--	DU_DMdata <= (others => '0');
	
-- Register File
regFile:	entity work.RegFile(Structural)
			port map(clk				=> s_clk,
						writeEnable		=> SW(7),
						writeReg			=> s_outm1,
						writeData		=> s_ALUout,
						readReg1			=> s_regrs,
						readReg2			=> s_regrt,
						readData1		=>	s_data1,
						readData2		=>	s_data2);

--Multiplexer 1
m1:		entity work.Mux2N(Behavioral)
			generic map(N		=> 5)
			port map(l0			=> s_regrt,
						l1			=> s_regrd,
						sel		=> SW(6),
						OutMux	=> s_outm1);

--Multiplexer 2
m2:		entity work.Mux2N(Behavioral)
			generic map(N		=> 32)
			port map(l0			=> s_data2,
						l1			=> s_offset,
						sel		=> SW(5),
						OutMux	=> s_outm2);

--ALU
ALU:		entity work.ALU32(Behavioral)
			port map(a		=>	s_data1,
						b		=>	s_outm2,
						op		=>	s_op,
						res	=>	s_ALUout,
						zero	=>	s_zero);
					--	ovf	=>
		DU_DMdata <= s_ALUout;

--ALU Control Unit
ALUctrl:	entity work.ALUCOntrolUnit(Behavioral)
			port map(ALUop			=>	SW(4 downto 3),
						funct			=> s_alufunct,
						ALUControl	=>	s_op);
			
						
	
------------------------------------------------------------------------------
-- Support Modules						
------------------------------------------------------------------------------

-- Display Unit
display:	entity work.DisplayUnit(Behavioral)
			generic map(dataPathType => SINGLE_CYCLE_DP,
							IM_ADDR_SIZE => ROM_ADDR_SIZE,
							DM_ADDR_SIZE => RAM_ADDR_SIZE)
			port map(RefClk	=> CLOCK_50,
						InputSel	=> SW(1 downto 0),	
						DispMode	=> SW(17),
						NextAddr	=> KEY(3),
						Dir		=> KEY(2),
						disp0		=> HEX0,
						disp1		=> HEX1,
						disp2		=> HEX2,
						disp3		=> HEX3,
						disp4		=> HEX4,
						disp5		=> HEX5,
						disp6		=> HEX6,
						disp7		=> HEX7);		

-- Debouncer
debncer:	entity work.DebounceUnit(Behavioral)
			generic map(inPolarity	=> '0',
							outPolarity => '1')
			port map(refClk	=> CLOCK_50, 
						dirtyIn	=> KEY(0), 
						pulsedOut=> s_clk);						
end Shell;
