//================================================================--
// Design Unit	: sn7411 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7411 triple and IC
//
// Dependences	: none
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7411 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14); 

   output P6, P8, P12;
   input P1, P2, P3, P4, P5, P7, P9, P10, P11, P13, P14;

   reg P6, P8, P12;

   always @(P3, P4, P5, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P6 = P3 & P4 & P5;
      end  
   end

   always @(P7, P9, P10, P11, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P8 = P9 & P10 & P11;
      end  
   end

   always @(P1, P2, P7, P13, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P12 = P1 & P2 & P13;
      end  
   end

endmodule
