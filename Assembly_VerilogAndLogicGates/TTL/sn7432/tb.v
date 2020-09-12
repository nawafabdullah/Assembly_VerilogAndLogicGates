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

   wire t_P3, t_P6, t_P8, t_P11;
   reg t_P1, t_P2, t_P4, t_P5, t_P7, t_P9, t_P10, t_P12, t_P13, t_P14;

   sn7432 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_P14=1; t_P7=0;

      // note, gates are tested sequentially

      cew_Test_Count=cew_Test_Count+1;
          t_P1=0;t_P2=0;#1;
          if ((t_P3) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 47");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=0;t_P2=1;#1;
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=1;t_P2=0;#1;
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 49");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=1;t_P2=1;#1;
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 50");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P4=0;t_P5=0;#1;
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 52");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=0;t_P5=1;#1;
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 53");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=1;t_P5=0;#1;
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 54");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=1;t_P5=1;#1;
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 55");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P9=0;t_P10=0;#1;
          if ((t_P8) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 57");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P9=0;t_P10=1;#1;
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 58");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P9=1;t_P10=0;#1;
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P9=1;t_P10=1;#1;
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P13=0;t_P12=0;#1;
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 62");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P13=0;t_P12=1;#1;
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P13=1;t_P12=0;#1;
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 64");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P13=1;t_P12=1;#1;
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 65");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end


      // gates cascaded
      t_P1=0;
      t_P2=0;
      t_P4=0; 

      assign t_P5=t_P3; 
      //t_P5=t_P3; 

      cew_Test_Count=cew_Test_Count+1;
          #1;
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end


      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

