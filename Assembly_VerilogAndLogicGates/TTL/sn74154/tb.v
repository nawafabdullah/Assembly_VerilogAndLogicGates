//================================================================--
// Design Unit  : cew testbench for sn7432
//
// File Name    : tb.cew
//
// Purpose      : design verification
//
// Note         :
//
// Limitations  :
//
// Errors       : none known
//
// Library      : sn7432 
//
// Dependences  : none
//
// Author       : Peter Walsh, Vancouver Island University
//
// System       : icarus (Linux)
//
//------------------------------------------------------------------
// Revision List
// Version      Author  Date    Changes
// 1.0          PW      Sep 10  New version
//================================================================--












module test_bench();

   integer cew_Test_Count=0;
          integer cew_Error_Count=0;

   wire t_P1,t_P2,t_P3,t_P4,t_P5,t_P6,t_P7,t_P8,t_P9,t_P10,t_P11,t_P13,t_P14,t_P15,t_P16,t_P17;
   reg t_P23, t_P22, t_P21, t_P20, t_P18, t_P19, t_P12, t_P24;

   sn74154 cut(t_P1,t_P2,t_P3,t_P4,t_P5,t_P6,t_P7,t_P8,t_P9,t_P10,t_P11,t_P12,t_P13,t_P14,t_P15,t_P16,t_P17,t_P18,t_P19,t_P20,t_P21,t_P22,t_P23,t_P24);

   initial begin
      t_P24=1; t_P12=0; t_P18=0; t_P19=0;
   
      t_P23=0;
      t_P22=0;
      t_P21=0;
      t_P20=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P1) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 46");
             $display("Actual Value is ", t_P1 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P2) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 47");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end

    
      t_P23=1;
      t_P22=0;
      t_P21=0;
      t_P20=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P1) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 54");
             $display("Actual Value is ", t_P1 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P2) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 55");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 56");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end


      t_P23=0;
      t_P22=1;
      t_P21=0;
      t_P20=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P2) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 62");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P4) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 64");
             $display("Actual Value is ", t_P4 );
             $display("Expected Value is ", 1 );
          end


      t_P23=0;
      t_P22=1;
      t_P21=1;
      t_P20=1; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 70");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P16) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 71");
             $display("Actual Value is ", t_P16 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P17) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 72");
             $display("Actual Value is ", t_P17 );
             $display("Expected Value is ", 1 );
          end


 
      t_P23=1;
      t_P22=1;
      t_P21=1;
      t_P20=1; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 79");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P16) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_P16 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P17) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 81");
             $display("Actual Value is ", t_P17 );
             $display("Expected Value is ", 0 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #10 $finish();
   end

endmodule

