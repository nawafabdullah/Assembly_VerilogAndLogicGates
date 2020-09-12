//================================================================--
// Design Unit	: control names (include)
//
// File Name	: controlSignal.v
//
// Purpose	: include file with control signal names
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 2016  New version
//================================================================--

//Control signals are all asserted active-high.
//The define macros below are used to enhance readability
//by replacing references like control[0] with control[HALT].
//
//Registers
//---------
//Program counter (PC) 16 bits
//Stack pointer (SP) 16 bits
//Memory register (MR) 16 bits
//ALU registers (R0, R1, R2, R3) 8 bits each
//Instruction Register (IR) 8 bits
//
//Busses/Signals
//--------------
//Internal address bus (int_abus) 16 bits
//Internal read data bus (int_rbus) 8 bits
//Internal write data bus (int_wbus) 8 bits
//ALU output (alu_out) 8 bits

`define MAX_CONTROL_LINES 22
//control[0:MAX_CONTROL_LINES-1]

`define WE 0 
// (WE) ? MEM mwmoey write cycle : memory read cycle
`define INIT_PC 1
// PC <= 0 
`define INC_PC 2
// PC <=  PC + 1
`define INIT_SP 3
// SP <= 0xFFFA 
`define INC_SP 4
// SP <= SP + 1
`define DEC_SP 5
// SP <= SP - 1
`define ABUS_PC 6
// int_abus <= PC
`define ABUS_SP 7
// int_abus <= SP
`define ABUS_MR 8 
// int_abus <= MR
`define IR_RBUS 9
// IR <= int_rbus 
`define R0_RBUS 10
// R0 <= int_rbus 
`define R1_RBUS 11
// R1 <= int_rbus 
`define WBUS_R0 12
// int_wbus <= R0
`define WBUS_R2 13
// int_wbus <= R2
`define WBUS_R3 14
// int_wbus <= R3
`define ADD_OP 15 
// R0 + R1
`define SUB_OP 16 
// R1 - R0
`define NOR_OP 17 
// R0 nor R1
`define R2_ALU 18
// R2 <=  alu output
`define R3_ALU 19
// R3 <=  alu output
`define PC_R1R0 20
// PC <=  {R1, R0}
`define MR_R1R0 21
// MR <=  {R1, R0}
