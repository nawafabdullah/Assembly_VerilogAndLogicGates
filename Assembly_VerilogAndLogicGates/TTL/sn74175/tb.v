//================================================================--
// Design Unit  : cew testbench for sn74175
//
// File Name    : tb.cew
//
// Purpose      : design verification
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

   wire t_P2, t_P3, t_P6, t_P7, t_P10, t_P11, t_P14, t_P15;
   reg t_P1, t_P4, t_P5, t_P8, t_P9, t_P12, t_P13, t_P16;

   sn74175 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14, t_P15, t_P16);

   task clockTick; // nasty syntax but task body can only be one (compound) statement
      begin
         t_P9=0; #3;
         t_P9=1; #6;
         t_P9=0; #3;
      end
   endtask

   // Test Master Reset - asynchronous active low

   task testMasterReset; begin
      cew_Test_Count=cew_Test_Count+1;
          t_P1<=0;#1;t_P1<=1;#1;
          if ((t_P2) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 39");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 40");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P7) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 42");
             $display("Actual Value is ", t_P7 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 43");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P10) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 45");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 46");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 48");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 49");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 1 );
          end

   end
   endtask

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_P16=1; t_P8=0;

      // Async Operation

      testMasterReset();

      // Normal Operation

      cew_Test_Count=cew_Test_Count+1;
          t_P4=1;clockTick();
          if ((t_P2) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 65");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 66");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P5=1;clockTick();
          if ((t_P7) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 68");
             $display("Actual Value is ", t_P7 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 69");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P12=1;clockTick();
          if ((t_P10) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 71");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 72");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P13=1;clockTick();
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 0 );
          end



      cew_Test_Count=cew_Test_Count+1;
          t_P4=0;clockTick();
          if ((t_P2) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 78");
             $display("Actual Value is ", t_P2 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P3) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 79");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P5=0;clockTick();
          if ((t_P7) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 81");
             $display("Actual Value is ", t_P7 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 82");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P12=0;clockTick();
          if ((t_P10) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 84");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 85");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P13=0;clockTick();
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 87");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 88");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 1 );
          end



      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

