//================================================================--
// Design Unit	: sn7486 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7486 quod xor IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7486 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14); 

   output P3, P6, P8, P11;
   input P1, P2, P4, P5, P7, P9, P10, P12, P13, P14;

   reg P3, P6, P8, P11;

   always @(P1, P2, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P3 = P1 ^ P2;
      end  
   end

   always @(P4, P5, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P6 = P4 ^ P5;
      end  
   end

   always @(P7, P9, P10, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P8 = P9 ^ P10;
      end  
   end

   always @(P7, P12, P13, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P11 = P12 ^ P13;
      end  
   end

endmodule
