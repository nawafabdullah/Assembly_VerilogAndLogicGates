//================================================================--
// Design Unit	: sn7474 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7474 dual edge-triggered D FF IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7474 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14); 

   output reg P5, P6, P8, P9;
   input P1, P2, P3, P4, P7, P10, P11, P12, P13, P14;

   always @ (posedge P3) begin
      if ((P14 == 1) && (P7 == 0) && (P1 == 1) && (P4 == 1)) begin
         P5 <= P2;
         P6 <= ~P2;
      end
   end

   always @ (P1, P4, P7, P14) begin
      if ((P14 == 1) && (P7 == 0)) begin
         if ((P1 == 0) && (P4 == 1)) begin
            P5 <= 1'b 0;
            P6 <= 1'b 1;
         end
         if ((P4 == 0) && (P1 == 1)) begin
            P5 <= 1'b 1;
            P6 <= 1'b 0;
         end
      end
   end

   always @ (posedge P11) begin
      if ((P14 == 1) && (P7 == 0)) begin
         P9 <= P12;
         P8 <= ~P12;
      end
   end

   always @ (P10, P13, P7, P14) begin
      if ((P14 == 1) && (P7 == 0)) begin
         if ((P13 == 0) && (P10 == 1)) begin
            P9 <= 1'b 0;
            P8 <= 1'b 1;
         end
         if ((P10 == 0) && (P13 == 1)) begin
            P9 <= 1'b 1;
            P8 <= 1'b 0;
         end
      end
   end

endmodule
