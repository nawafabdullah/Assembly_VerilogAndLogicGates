//================================================================--
// Design Unit	: memory_unit (behaviour)
//
// File Name	: behaviour.v
//
// Purpose	: implement SSBC memory unit  (MU)
//
// Author	: Peter Walsh, Vancouver Island University
//
// Environmant	: Icarus
//-------------------------------------------------------------------
// Revision List	
// Version	Author	Date	Changes
// 1.0		PW	Nov 2016  New version
//================================================================--

module memory_unit (we, int_rbus, int_wbus, int_abus, porta, portb, portc, portd, psw, Z, N, clk, reset); 

   input wire we, clk, reset;
   output wire [7:0] int_rbus;
   input wire [15:0] int_abus;
   input wire [7:0] int_wbus;
   output wire [7:0] porta;
   input wire [7:0] portb;
   output wire [7:0] portc;
   input wire [7:0] portd;
   input wire Z;
   input wire N;
   output reg [7:0] psw;
  
   reg [7:0] ram[0:65535];
   reg [15:0] abus; // needed for the continuous assignment below

   integer i, j, r, ch, fh;

   always @(posedge reset) begin

      if (reset == 1'b1) begin
         // initialize PSW 
         ram[16'hFFFB] = 8'b00000000;

         // read mac file
         //$readmemb("mac", ram);

         fh = $fopen("mac", "r");
         if (fh == 0) 
            $display("could not open input machine file");
         else begin
            i = 0; j = 7;
            ch = $fgetc(fh); // priming read
            while  (!$feof(fh)) begin
               if (ch == "0")
                  ram[i][j] = 1'b0;
               else  if (ch == "1") 
                  ram[i][j] = 1'b1;
               else  begin
                  // discard the rest of the line
                  while ((ch != "\n") && (!$feof(fh)))  //(eol and eof)
                     ch = $fgetc(fh);
               end
 
               ch = $fgetc(fh);

               if ((ch == "1") || (ch == "0")) begin
                  if (j == 0) begin
                     j = 7;
                     i = i + 1; 
                  end else
                     j = j - 1;
               end
            end
            ram[16'h0100] = 8'b00000011;
         end
      end

   end

   always @(posedge clk) begin

      if (we)
         ram[int_abus] = int_wbus;

      abus <= int_abus;

   end

   always @(Z, N) begin

      ram[16'hFFFB][7] <= Z;
      ram[16'hFFFB][6] <= N;

   end

   always @(portb) begin

      ram[16'hFFFD] <= portb;

   end 

   always @(portd) begin

      ram[16'hFFFF] <= portd;

   end 

   always @(ram[16'hFFFB]) begin
      psw <= ram[16'hFFFB];
   end

   assign int_rbus = ram[abus];
   assign porta = ram[16'hFFFC];
   assign portc = ram[16'hFFFE];

endmodule
