//================================================================--
// Design Unit  : cew testbench for sn7411
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
// Library      : sn7411 
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

   sn7413 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14);

   initial begin
      t_P14=1; t_P7=0;

      // note, gates are tested sequentially

      t_P1=0;
      t_P2=0;
      t_P4=0;
      t_P5=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      t_P1=1;
      t_P2=1;
      t_P4=1;
      t_P5=1; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 54");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end


      t_P9=0;
      t_P10=0;
      t_P12=0;
      t_P13=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end


      t_P9=1;
      t_P10=1;
      t_P12=1;
      t_P13=1; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 66");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 0 );
          end

      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #10 $finish();
   end

endmodule

