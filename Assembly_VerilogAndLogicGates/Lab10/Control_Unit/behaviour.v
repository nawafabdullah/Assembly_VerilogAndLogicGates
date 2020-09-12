//================================================================--
// Design Unit	: Control Unit (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement the SSBC Control Unit FSM
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 2016 New version
//================================================================--

`include "controlSignal.v"
`include "controlParam.v"

module control_unit (control, clk, opcode, psw, reset, halt, fault, break); 

   input wire clk;
   input wire reset;
   input wire [7:0] opcode;
   input wire [7:0] psw;
   output reg [0:`MAX_CONTROL_LINES-1] control;
   output reg halt, fault, break;

   reg [7:0] state, nextState;

   task clearControl;

      integer i;

      begin
         for (i=0; i<`MAX_CONTROL_LINES; i=i+1)
            control[i] <= 1'b0;
         #1;
      end

   endtask

   // state assignment

   always @(posedge clk, posedge reset) begin
      if (reset == 1'b1) begin
         state <= `INIT0;
         halt <= 1'b0;
         fault <= 1'b0;
         break <= 1'b0;
      end else 
         state <= nextState;
   end

   // next state and output  functions

   always @(state, opcode, psw) begin
      case (state)
         `INIT0: begin
            clearControl();
            control[`INIT_PC] <= 1'b1; 
            control[`INIT_SP] <= 1'b1; 
            nextState <= `INIT1;
         end
         `INIT1: begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            break <= 1'b0;
            nextState <= `INIT2;
         end
         `INIT2: begin
            clearControl();
            control[`IR_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `INIT3;
         end
         `INIT3: begin
            clearControl();
            case (opcode) 
               8'h00 : begin
                  // nop
                  break <= 1'b1;
                  nextState <= `INIT1;
               end
               8'h01 : begin
                  // halt
                  break <= 1'b1;
                  halt <= 1'b1;
               end
               8'h02 : begin
                  nextState <= `PUSHIMM0;
               end
               8'h03 : begin
                  nextState <= `PUSHEXT0;
               end
               8'h04 : begin
                  // popinh
                  control[`INC_SP] <= 1'b1; 
                  break <= 1'b1;
                  nextState <= `INIT1;
               end
               8'h05 : begin
                  nextState <= `POPEXT0;
               end
               8'h06 : begin
                  nextState <= `JNZ0;
               end
               8'h07 : begin
                  nextState <= `JNN0;
               end
               8'h08 : begin
                  nextState <= `ADD0;
               end
               8'h09 : begin
                  nextState <= `SUB0;
               end
               8'h0A : begin
                  nextState <= `NOR0;
               end
               default : fault <= 1'b1;
            endcase
         end
         `PUSHIMM0 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `PUSHIMM1;
         end
         `PUSHIMM1 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `PUSHIMM2;
         end
         `PUSHIMM2 : begin
            clearControl();
            control[`WBUS_R0] <= 1'b1; 
            control[`ABUS_SP] <= 1'b1; 
            control[`WE] <= 1'b1; 
            nextState <= `PUSHIMM3;
         end
         `PUSHIMM3 : begin
            clearControl();
            control[`DEC_SP] <= 1'b1; 
            break <= 1'b1;
            nextState <= `INIT1;
         end

         `PUSHEXT0 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `PUSHEXT1;
         end
         `PUSHEXT1 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `PUSHEXT2;
         end
         `PUSHEXT2 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `PUSHEXT3;
         end
         `PUSHEXT3 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `PUSHEXT4;
         end
         `PUSHEXT4 : begin
            clearControl();
            control[`MR_R1R0] <= 1'b1; 
            nextState <= `PUSHEXT5;
         end
         `PUSHEXT5 : begin
            clearControl();
            control[`ABUS_MR] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `PUSHEXT6;
         end
         `PUSHEXT6 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
            nextState <= `PUSHEXT7;
         end
         `PUSHEXT7 : begin
            clearControl();
            control[`WBUS_R0] <= 1'b1; 
            control[`ABUS_SP] <= 1'b1; 
            control[`WE] <= 1'b1; 
            nextState <= `PUSHEXT8;
         end
         `PUSHEXT8 : begin
            clearControl();
            control[`DEC_SP] <= 1'b1; 
            break <= 1'b1;
            nextState <= `INIT1;
         end

         `POPEXT0 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `POPEXT1;
         end
         `POPEXT1 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `POPEXT2;
         end
         `POPEXT2 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `POPEXT3;
         end
         `POPEXT3 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
            control[`INC_PC] <= 1'b1; 
            nextState <= `POPEXT4;
         end
         `POPEXT4 : begin
            clearControl();
            control[`MR_R1R0] <= 1'b1; 
            control[`INC_SP] <= 1'b1; 
            nextState <= `POPEXT5;
         end
         `POPEXT5 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1; 
            control[`WE] <= 1'b0; 
            nextState <= `POPEXT6;
         end
         `POPEXT6 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1; 
            nextState <= `POPEXT7;
         end
         `POPEXT7 : begin
            clearControl();
            control[`WBUS_R0] <= 1'b1; 
            control[`ABUS_MR] <= 1'b1; 
            control[`WE] <= 1'b1; 
            nextState <= `POPEXT8;
         end
         `POPEXT8 : begin
            clearControl();
            break <= 1'b1;
            nextState <= `INIT1;
         end

         `JNZ0 : begin
            clearControl();
            if (psw[7] == 1'b0) begin
               // jump
               clearControl();
               control[`ABUS_PC] <= 1'b1;
               control[`WE] <= 1'b0;
               nextState <= `JNZ2;
            end else begin
               control[`INC_PC] <= 1'b1; 
               nextState <= `JNZ1;
            end
         end
         `JNZ1 : begin
            clearControl();
            control[`INC_PC] <= 1'b1; 
            break <= 1'b1;
            nextState <= `INIT1;
         end      
         `JNZ2 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1;
            control[`INC_PC] <= 1'b1;
            nextState <= `JNZ3;
         end
         `JNZ3 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `JNZ4;
         end
         `JNZ4 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1;
            control[`INC_PC] <= 1'b1;
            nextState <= `JNZ5;
         end
         `JNZ5 : begin
            clearControl();
            control[`PC_R1R0] <= 1'b1;
            break <= 1'b1;
            nextState <= `INIT1;
         end

         `JNN0 : begin
            clearControl();
            if (psw[6] == 1'b0) begin
               // jump
               clearControl();
               control[`ABUS_PC] <= 1'b1;
               control[`WE] <= 1'b0;
               nextState <= `JNN2;
            end else begin
               control[`INC_PC] <= 1'b1;
               nextState <= `JNN1;
            end
         end
         `JNN1 : begin
            clearControl();
            control[`INC_PC] <= 1'b1;
            break <= 1'b1;
            nextState <= `INIT1;
         end
         `JNN2 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1;
            control[`INC_PC] <= 1'b1;
            nextState <= `JNN3;
         end
         `JNN3 : begin
            clearControl();
            control[`ABUS_PC] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `JNN4;
         end
         `JNN4 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1;
            control[`INC_PC] <= 1'b1;
            nextState <= `JNN5;
         end
         `JNN5 : begin
            clearControl();
            control[`PC_R1R0] <= 1'b1;
            break <= 1'b1;
            nextState <= `INIT1;
         end

         `ADD0 : begin
            clearControl();
            control[`INC_SP] <= 1'b1;
            nextState <= `ADD1;
         end
         `ADD1 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `ADD2;
         end
         `ADD2 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1;
            control[`INC_SP] <= 1'b1;
            nextState <= `ADD3;
         end
         `ADD3 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `ADD4;
         end
         `ADD4 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1;
            nextState <= `ADD5;
         end
         `ADD5 : begin
            clearControl();
            control[`ADD_OP] <= 1'b1;
            nextState <= `ADD6;
         end
         `ADD6 : begin
            clearControl();
            control[`R3_ALU] <= 1'b1;
            nextState <= `ADD7;
         end
         `ADD7 : begin
            clearControl();
            control[`WBUS_R3] <= 1'b1;
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b1;
            nextState <= `ADD8;
         end
         `ADD8 : begin
            control[`DEC_SP] <= 1'b1;
            break <= 1'b0;
            nextState <= `INIT1;
         end

         `SUB0 : begin
            clearControl();
            control[`INC_SP] <= 1'b1;
            nextState <= `SUB1;
         end
         `SUB1 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `SUB2;
         end
         `SUB2 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1;
            control[`INC_SP] <= 1'b1;
            nextState <= `SUB3;
         end
         `SUB3 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `SUB4;
         end
         `SUB4 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1;
            nextState <= `SUB5;
         end
         `SUB5 : begin
            clearControl();
            control[`SUB_OP] <= 1'b1;
            nextState <= `SUB6;
         end
         `SUB6 : begin
            clearControl();
            control[`R3_ALU] <= 1'b1;
            nextState <= `SUB7;
         end
         `SUB7 : begin
            clearControl();
            control[`WBUS_R3] <= 1'b1;
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b1;
            nextState <= `SUB8;
         end
         `SUB8 : begin
            control[`DEC_SP] <= 1'b1;
            break <= 1'b0;
            nextState <= `INIT1;
         end

         `NOR0 : begin
            clearControl();
            control[`INC_SP] <= 1'b1;
            nextState <= `NOR1;
         end
         `NOR1 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `NOR2;
         end
         `NOR2 : begin
            clearControl();
            control[`R1_RBUS] <= 1'b1;
            control[`INC_SP] <= 1'b1;
            nextState <= `NOR3;
         end
         `NOR3 : begin
            clearControl();
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b0;
            nextState <= `NOR4;
         end
         `NOR4 : begin
            clearControl();
            control[`R0_RBUS] <= 1'b1;
            nextState <= `NOR5;
         end
         `NOR5 : begin
            clearControl();
            control[`NOR_OP] <= 1'b1;
            nextState <= `NOR6;
         end
          `NOR6 : begin
            clearControl();
            control[`R2_ALU] <= 1'b1;
            nextState <= `NOR7;
         end
         `NOR7 : begin
            clearControl();
            control[`WBUS_R2] <= 1'b1;
            control[`ABUS_SP] <= 1'b1;
            control[`WE] <= 1'b1;
            nextState <= `NOR8;
         end
         `NOR8 : begin
            control[`DEC_SP] <= 1'b1;
            break <= 1'b0;
            nextState <= `INIT1;
         end
      endcase
   end

endmodule
