//================================================================--
// Design Unit	: sn74175 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN74175 quod D FF IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn74175 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16); 

   output reg P2, P3, P6, P7, P10, P11, P14, P15;
   input P1, P4, P5, P8, P9, P12, P13, P16;

   always @ (posedge P9) begin
      if ((P16 == 1'b 1) && (P8 == 1'b 0)) begin
         // Q0 and Q0_BAR
         P2 <= P4;
         P3 <= ~P4;
         // Q1 and Q1_BAR
         P7 <= P5;
         P6 <= ~P5;
         // Q2 and Q2_BAR
         P10 <= P12;
         P11 <= ~P12;
         // Q3 and Q3_BAR
         P15 <= P13;
         P14 <= ~P13;
      end
   end

   always @ (P1) begin
      if ((P16 == 1'b 1) && (P8 == 1'b 0)) begin
         if (P1 == 0) begin
            // Q0 and Q0_BAR
            P2 <= 1'b0;
            P3 <= 1'b1;
            // Q1 and Q1_BAR
            P7 <= 1'b0;
            P6 <= 1'b1;
            // Q2 and Q2_BAR
            P10 <= 1'b0;
            P11 <= 1'b1;
            // Q3 and Q3_BAR
            P15 <= 1'b0;
            P14 <= 1'b1;
         end
      end
   end

endmodule
