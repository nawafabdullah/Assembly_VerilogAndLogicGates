//================================================================--
// Design Unit	: sn7404 (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7404 hex inverter IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7404 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14); 

   output P2, P4, P6, P8, P10, P12;
   input P1, P3, P5, P7, P9, P11, P13, P14;

   reg P2, P4, P6, P8, P10, P12;

   always @(P1, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P2 = ~P1;
      end
   end

   always @(P3, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P4 = ~P3;
      end
   end

   always @(P5, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P6 = ~P5;
      end
   end

   always @(P7, P9, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P8 = ~P9;
      end
   end

   always @(P7, P11, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P10 = ~P11;
      end
   end

   always @(P7, P13, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P12 = ~P13;
      end
   end

endmodule
