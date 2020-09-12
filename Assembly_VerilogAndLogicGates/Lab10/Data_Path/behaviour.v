//================================================================--
// Design Unit	: data_path (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement SSBC data path 
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 2016  New version
//================================================================--

`include "controlSignal.v"

module data_path (control, IR, int_rbus, int_wbus, int_abus, Z, N, clk); 

   input wire clk;
   input wire [7:0] int_rbus;
   output wire [15:0] int_abus;
   output wire [7:0] int_wbus;
   output wire Z;
   output wire N;
   output reg [7:0] IR;
   input wire [0:`MAX_CONTROL_LINES-1] control;


   reg [7:0] R0, R1, R2, R3, RN;
   reg [15:0] PC, SP, MR;
   reg [7:0] wbus, rbus, alu;
   reg [15:0] abus;

   always @(posedge clk) begin


      if (control[`INIT_PC] == 1'b1)
         PC <= 16'h0000;

      if (control[`INC_PC] == 1'b1)
          PC <= PC + 1;

      if (control[`INIT_SP] == 1'b1)
         SP <= 16'hFFFA;

      if (control[`INC_SP] == 1'b1)
          SP <= SP + 1;

      if (control[`DEC_SP] == 1'b1)
          SP <= SP - 1;

      if (control[`IR_RBUS] == 1'b1)
          IR <= int_rbus;

      if (control[`R0_RBUS] == 1'b1)
          R0 <= int_rbus;

      if (control[`R1_RBUS] == 1'b1)
          R1 <= int_rbus;

      if (control[`R2_ALU] == 1'b1)
          R2 <= alu;

      if (control[`R3_ALU] == 1'b1)
          R3 <= alu;

      if (control[`PC_R1R0] == 1'b1)
         PC <= {R1, R0};

      if (control[`MR_R1R0] == 1'b1)
         MR <= {R1, R0};

   end

   always@(control[`ABUS_PC], control[`ABUS_SP], control[`ABUS_MR], PC, SP, MR) begin

      if (control[`ABUS_PC] == 1'b1)
          abus <= PC;

      if (control[`ABUS_SP] == 1'b1)
          abus <= SP;

      if (control[`ABUS_MR] == 1'b1)
          abus <= MR;

   end 

   always@(control[`ADD_OP], control[`SUB_OP], control[`NOR_OP], R0, R1) begin

      if (control[`ADD_OP] == 1'b1)
         alu <= R0 + R1;

      if (control[`SUB_OP] == 1'b1) begin
         RN = ~R0 + 1'b1; // blocking assignment
         alu <= R1 + RN;
      end

      if (control[`NOR_OP] == 1'b1)
         alu <= ~(R0 | R1);
   end

   always@(control[`WBUS_R0], control[`WBUS_R2], control[`WBUS_R3], R0, R2, R3) begin

      if (control[`WBUS_R0] == 1'b1)
         wbus <= R0;

      if (control[`WBUS_R2] == 1'b1)
         wbus <= R2;
   
      if (control[`WBUS_R3] == 1'b1)
         wbus <= R3;
   end

   assign Z = (R3 == 8'b00000000) ? 1'b1 : 1'b0;
   assign N = (R3[7] == 1'b1) ? 1'b1 : 1'b0;
   assign int_abus = abus;
   assign int_wbus = wbus;

endmodule
