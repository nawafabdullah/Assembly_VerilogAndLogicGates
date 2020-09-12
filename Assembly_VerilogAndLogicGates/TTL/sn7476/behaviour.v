//================================================================--
// Design Unit	: sn7476 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN7476 dual negative master-slave FF IC
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
//================================================================--

module sn7476 (P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16); 

   output reg P10, P11, P14, P15;
   input P1, P2, P3, P4, P5, P6, P7, P8, P9, P12, P13, P16;

   reg master1, master2;

   // FF #1 
   always @ (P2, P3, P1, P4, P16) begin
      if ((P5 == 1'b 1) && (P13 == 1'b 0)) begin
         // async operation
         if (P2 == 1'b 0) begin // assume P3==1
            P15<=1'b 1;
            P14<=1'b 0;
            master1<=1;
         end else if (P3 == 1'b 0) begin //assume P2==1
            P15<=1'b 0;
            P14<=1'b 1;
            master1<=0;
         end else if (P1 == 1'b 1) begin // sync operation
            if ((P16 == 1'b 1) && (P4 == 1'b 0)) 
               master1<=0;
            else if  ((P16 == 1'b 0) && (P4 == 1'b 1)) 
               master1<=1;
            else if ((P16 == 1'b 1) && (P4 == 1'b 1)) 
               master1<=P14;
         end else begin
            P15<=master1;
            P14<=~master1;
         end
      end
   end

   // FF #2 
   always @ (P7, P8, P6, P9, P12) begin
      if ((P5 == 1'b 1) && (P13 == 1'b 0)) begin
         // async operation
         if (P7 == 1'b 0) begin // assume P8==1
            P11<=1'b 1;
            P10<=1'b 0;
            master2<=1;
         end else if (P8 == 1'b 0) begin //assume P7==1
            P11<=1'b 0;
            P10<=1'b 1;
            master2<=0;
         end else if (P6 == 1'b 1) begin // sync operation
            if ((P12 == 1'b 1) && (P9 == 1'b 0)) 
               master2<=0;
            else if  ((P12 == 1'b 0) && (P9 == 1'b 1))
               master2<=1;
            else if ((P12 == 1'b 1) && (P9 == 1'b 1)) 
               master2<=P10;
         end else begin
            P11<=master2;
            P10<=~master2;
         end
      end
   end


endmodule
