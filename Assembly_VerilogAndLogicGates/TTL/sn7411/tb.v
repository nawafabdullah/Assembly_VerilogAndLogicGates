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

   wire t_P6, t_P8, t_P12;
   reg t_P1, t_P2, t_P3, t_P4, t_P5, t_P7, t_P9, t_P10, t_P11, t_P13, t_P14;
   integer i;

   // Gold function returns x and y and z
   function gold;
      input x;
      input y;
      input z;

      gold=(x&y&z);
   endfunction

   sn7411 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_P14=1; t_P7=0;

      // note, gates are tested sequentially

      for (i=0; i<8; i=i+1)
         begin
         cew_Test_Count=cew_Test_Count+1;
          t_P1=i[2];t_P2=i[1];t_P13=i[0];#1;
          if ((t_P12) !== (gold(t_P1, t_P2, t_P13))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_P12 );
             $display("Expected Value is ", gold(t_P1, t_P2, t_P13) );
          end

         cew_Test_Count=cew_Test_Count+1;
          t_P3=i[2];t_P4=i[1];t_P5=i[0];#1;
          if ((t_P6) !== (gold(t_P3, t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P3, t_P4, t_P5) );
          end

         cew_Test_Count=cew_Test_Count+1;
          t_P9=i[2];t_P10=i[1];t_P11=i[0];#1;
          if ((t_P6) !== (gold(t_P3, t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 61");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P3, t_P4, t_P5) );
          end

         end
      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

