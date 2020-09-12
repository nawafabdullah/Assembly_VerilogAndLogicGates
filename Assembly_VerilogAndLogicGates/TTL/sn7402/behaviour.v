//================================================================--
// Design Unit	: sn7402 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7402 quod nor IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7402 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14); 

   output P1, P4, P10, P13;
   input P2, P3, P5, P6, P7, P8, P9, P11, P12, P14;

   reg P1, P4, P10, P13;

   always @(P2, P3, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P1 = P2 ~| P3;
      end  
      
   end

   always @(P5, P6, P7, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P4 = P5 ~| P6;
      end  
      
   end

   always @(P7, P8, P9, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P10 = P8 ~| P9;
      end  
      
   end

   always @(P7, P11, P12, P14) begin

      if ((P14 == 1'b 1) && (P7 == 1'b 0)) begin
         P13 = P11 ~| P12;
      end  
      
   end


endmodule
