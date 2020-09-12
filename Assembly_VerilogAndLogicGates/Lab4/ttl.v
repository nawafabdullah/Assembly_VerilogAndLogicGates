//================================================================--
// Design Unit	: lab4 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement LED driver (digits 0 through 9)
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7432, sn7410, sn7413, sn74154
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
// 1.1          NH      Oct  19 Modified to meet specifications
//================================================================--

module lab4 (w, x, y, z, a, b, c, d, e, f, g, dp); 

   output a, b, c, d, e, f, g, dp;
   input w, x, y, z;

   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;
   reg dp=0, G1_BAR=0, G2_BAR=0;
   wire  D0_BAR, D1_BAR, D2_BAR, D3_BAR, D4_BAR, D5_BAR, D6_BAR, D7_BAR, D8_BAR, D9_BAR, D10_BAR, D11_BAR, D12_BAR, D13_BAR, D14_BAR, D15_BAR;
   wire  I1,I2,I3;
   
   sn74154 decoder(D0_BAR, D1_BAR, D2_BAR, D3_BAR, D4_BAR, D5_BAR, D6_BAR, D7_BAR, D8_BAR, D9_BAR, D10_BAR, GND, D11_BAR, D12_BAR, D13_BAR, D14_BAR, D15_BAR, G1_BAR, G2_BAR, w, x, y, z, VCC);

   sn7408 and_gate(D2_BAR, I1, f, D5_BAR, D6_BAR, b, GND, e, I3, I1, g, I2, D0_BAR, VCC);

   sn7408 and1_gate(D1_BAR, D4_BAR, a, D1_BAR, D7_BAR, I2, GND, d, I2, D4_BAR, I1, I2, D3_BAR, VCC);
  
   sn7411 three_input_and_gate(D4_BAR, D5_BAR, DC, DC, DC, , GND, , DC, DC, DC, I3, D9_BAR, VCC);
   
   assign c = D2_BAR;

endmodule
