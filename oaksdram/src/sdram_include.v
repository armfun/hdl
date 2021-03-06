


//sdram_include.v
`ifdef SDRAM_INCLUDE_V
`else
`define SDRAM_INCLUDE_V

`timescale 1ns/10ps

//---------------------------------------------------------------------------
// Frequency and timeouts
//---------------------------------------------------------------------------
`define SYS_CLK_FREQUENCY   50000     // in kHz
`define SDRAM_CLK_MULTIPLY    2        
`define SDRAM_CLK_DIVIDE      1

//---------------------------------------------------------------------------
// Width
//---------------------------------------------------------------------------
`define CMD_WIDTH  3
`define A_WIDTH    12
`define BA_WIDTH   2
`define DQ_WIDTH   16
`define DQS_WIDTH  2
`define DM_WIDTH   2


//----------------------------------------------------------------------------
// Configuration registers
//----------------------------------------------------------------------------
//Burst
//Burst Length = 2 (32 bits)
//CAS Latency = 2
//Sequential
`define SDRAM_INIT_LMR	12'b000000100001
//A[11:10]	RESERVED: 0, 0
//A[9]		Write Burst Mode
//				0: 	Programed burst length
//				1:	Single Location Address
//A[8:7]	Operation Mode
//				00: Standard Operation Mode
//A[6:4]	CAS Latency
//				010: 2
//				011: 3
//A[3]		Burst Type
//				0:	Sequential
//				1:	Interleaved
//A[2:0]	Burst Length
//				001:	2


//----------------------------------------------------------------------------
// FML constants
//----------------------------------------------------------------------------
`define FML_ADR_RNG     25:4 
`define FML_ADR_BA_RNG  25:24
`define FML_ADR_ROW_RNG 23:11
`define FML_ADR_COL_RNG 10:4
`define FML_DAT_RNG     31:0
`define FML_BE_RNG       3:0

//----------------------------------------------------------------------------
// SDRAM constants
//----------------------------------------------------------------------------
`define SDRAM_CMD_NOP   3'b111
`define SDRAM_CMD_ACT   3'b011
`define SDRAM_CMD_READ  3'b101
`define SDRAM_CMD_WRITE 3'b100
`define SDRAM_CMD_TERM  3'b110
`define SDRAM_CMD_PRE   3'b010
`define SDRAM_CMD_AR    3'b001
`define SDRAM_CMD_MRS   3'b000

`define ADR_BA_RNG    25:24
`define ADR_ROW_RNG   23:11
`define ADR_COL_RNG   10:4

//ACTIVE -> READ 2 clock cycles 7E
`define T_RCD	2			
//READ -> DATA READY 2 clock cycles for CAS latency
`define T_CAS	2		
//PRECHARGE -> finished	
`define T_RP	2			
//READ -> READ
`define T_CCD	1			
//AUTO REFRESH to ready
`define T_RFC	7		
//XXX: 16 IS ONLY FOR SIMULATION
`define T_PLL	11000
//MODE Register Set
`define T_MRD	2
//WRITE recovery time
`define T_WR 2

//Auto Refresh Timeout
`define T_AR_TIMEOUT	6000000
`endif
