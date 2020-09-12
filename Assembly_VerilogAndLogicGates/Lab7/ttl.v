//================================================================--
// Design Unit	: lab7 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement 1100 1000 non-resetting sequence detector
//
// Author	: Peter Walsh, Vancouver Island University
// modified
//
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Sept 10 New version
// 1.1		PW	June 20 2013 review
// 1.2          NH      Nov  19 2019 modified to meet specs
//================================================================--

module lab7 (Z_BAR, state,  clk, X, reset);

   output Z_BAR;
   input wire clk, reset, X;
   output wire [0:2] state;
 
   parameter S0 = 3'b001, S1 = 3'b101, S2 = 3'b111;
   parameter S3 = 3'b010, S4 = 3'b011, S5 = 3'b000;
   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0, TR=1'b 1;
   wire  TA, TB, TC, QA, QA_BAR, QB, QB_BAR, QC, QC_BAR, I1;

   sn7486 xor_gates(QA, X, TA, QA, QB, TB, GND, TC, QC, I1, , DC, DC, VCC);
 
   sn7432 or_gates(X, QB_BAR, I1, X, QC, Z_BAR, GND, , DC, DC, , DC, DC, VCC);

   sn7476 jkff1(clk, TR, reset, TA, VCC, clk, TR, reset, TB, QB_BAR, QB, TB, GND, QA_BAR, QA, TA);

   sn7476 jkff2(clk, reset, TR, TC, VCC, DC, DC, DC, DC, , , DC, GND, QC_BAR, QC, TC);

   assign state[0]=QA;
   assign state[1]=QB;
   assign state[2]=QC;
endmodule
