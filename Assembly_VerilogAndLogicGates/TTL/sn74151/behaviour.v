//================================================================--
// Design Unit	: sn74151 (behaviour) 
//
// File Name	: behaviour.v
//
// Purpose	: model of TTL SN74151  8-bit mux 
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 10 New version
//================================================================--

module sn74151 (P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16); 

   output P5, P6;
   input P1, P2, P3, P4, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16;

   reg [2:0] control;
   reg P5, P6;

   always @(P1,P2, P3, P4, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16) begin

      if ((P8 == 1'b 0) && (P16 == 1'b 1)) begin

         if (P7 == 1'b 1) begin
            P5=1'b 0;
            P6=1'b 1;
         end else begin 
            
            control={P9, P10, P11}; 
            case (control)
               3'b000: P5=P4; 
               3'b001: P5=P3;
               3'b010: P5=P2;
               3'b011: P5=P1;
               3'b100: P5=P15;
               3'b101: P5=P14;
               3'b110: P5=P13;
               3'b111: P5=P12;
            endcase 

            P6=~P5;

         end
      end
      
   end

endmodule
