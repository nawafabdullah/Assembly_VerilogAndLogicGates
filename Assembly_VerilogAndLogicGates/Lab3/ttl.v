//================================================================--
// Design Unit	: lab3 (structural)
//
// File Name	: ttl.v
//
// Purpose	: implement LED driver (characters A through F)
//
// Note		:
//
// Limitations	:
//
// Errors	: none known
//
// Library 	: sn7408, sn7404, sn7432
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
// 1.1          	NH  Oct2019 added wires and modified to meets specs
//================================================================--

module lab3 (w, x, y, z, a, b, c, d, e, f, g, dp); 

   output a, b, d, e, dp; 
   output reg g,c,f;
   input w, x, y, z;
   wire IXbAYb, IXbAZ, IZbAX, IYbAZ, IZbAXOY, Id2, W_bar, X_bar, Y_bar, Z_bar;
    
   parameter GND=1'b 0, VCC=1'b 1, DC=1'b 0;

   always @(y) begin
      g<=y;
   end

   always @(b) begin
      c<=b;
   end

   always @(e) begin
      f<=e;
   end

   sn7408 and_gates(X_bar, Y_bar, IXbAYb, X_bar, z, IXbAZ, GND, IZbAX, Z_bar, x, IYbAZ, Y_bar, z, VCC);

   sn7432 or_gates(IZbAX, y, IZbAXOY, IZbAXOY, IYbAZ, a, GND, b, X_bar, IYbAZ, Id2, IXbAZ, IZbAX, VCC);

   sn7432 or_gates1(Id2, IYbAZ, d, IZbAX, y, IZbAXOY, GND, e, IZbAXOY, IYbAZ, dp, IXbAYb, W_bar, VCC);
   
   sn7404 inv_gates(w, W_bar, x, X_bar, y, Y_bar, GND, Z_bar, z, , DC, , DC, VCC);



endmodule
