//================================================================--
// Design Unit	: sn74154 (behaviour) 
//
// File Name	: sn74154.v
//
// Purpose	: model of TTL SN74154  only the (normal behaviour) decoder part is modelled 
//                (i.e., the demultiplexor is not modelled).
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 10 New version
//================================================================--

module sn74154 (P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24); 

   output P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P13, P14, P15, P16, P17;
   input P23, P22, P21, P20, P18, P19, P12, P24;
   //    A    B    C    D    G1   G2   GND  VCC

   reg [3:0] control;
   reg [1:16] O;
   reg P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P13, P14, P15, P16, P17;

   always @(P23, P22, P21, P20, P18, P19, P12, P24) begin

      if ((P24 == 1'b 1) && (P12 == 1'b 0) &&  (P18 == 1'b 0) && (P19 == 1'b 0)) begin
      
         control={P20, P21, P22, P23}; 
         case (control)
            4'b0000: O=16'b0111111111111111; 
            4'b0001: O=16'b1011111111111111;
            4'b0010: O=16'b1101111111111111;
            4'b0011: O=16'b1110111111111111;
            4'b0100: O=16'b1111011111111111;
            4'b0101: O=16'b1111101111111111;
            4'b0110: O=16'b1111110111111111;
            4'b0111: O=16'b1111111011111111;
            4'b1000: O=16'b1111111101111111;
            4'b1001: O=16'b1111111110111111;
            4'b1010: O=16'b1111111111011111;
            4'b1011: O=16'b1111111111101111;
            4'b1100: O=16'b1111111111110111;
            4'b1101: O=16'b1111111111111011;
            4'b1110: O=16'b1111111111111101;
            4'b1111: O=16'b1111111111111110;
         endcase 

            P1=O[1];
            P2=O[2];
            P3=O[3];
            P4=O[4];
            P5=O[5];
            P6=O[6];
            P7=O[7];
            P8=O[8];
            P9=O[9];
            P10=O[10];
            P11=O[11];
            P13=O[12];
            P14=O[13];
            P15=O[14];
            P16=O[15];
            P17=O[16]; 

      end
      
   end

endmodule
