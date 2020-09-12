//================================================================--
// Design Unit  : cew testbench for sn7476
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

   wire t_P10, t_P11, t_P14, t_P15;
   reg t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P12, t_P13, t_P16;

   sn7476 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14, t_P15, t_P16);

   task clockTick1; // nasty syntax but task body can only be one (compound) statement
      begin
         t_P1=0; #3;
         t_P1=1; #6;
         t_P1=0; #3;
      end
   endtask

   task clockTick2; 
      begin
         t_P6=0; #3;
         t_P6=1; #6;
         t_P6=0; #3;
      end
   endtask

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_P5=1; t_P13=0; #1;

      // Async Operation

      cew_Test_Count=cew_Test_Count+1;
          t_P2=0; t_P3=1; #1;
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 52");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P2=1; t_P3=0; #1;
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 53");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P2=1; t_P3=1; #1;
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 54");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

     
      cew_Test_Count=cew_Test_Count+1;
          t_P7=0; t_P8=1; #1;
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 56");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P7=1; t_P8=0; #1;
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 57");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P7=1; t_P8=1; #1;
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 58");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end


      // Normal Operation

      cew_Test_Count=cew_Test_Count+1;
          t_P16=1;t_P4=0;clockTick1();
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 62");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P16=0;t_P4=1;clockTick1();
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 64");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 65");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P16=0;t_P4=0;clockTick1();
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 66");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 67");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P16=1;t_P4=1;clockTick1();
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 68");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P14) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 69");
             $display("Actual Value is ", t_P14 );
             $display("Expected Value is ", 1 );
          end

      
      cew_Test_Count=cew_Test_Count+1;
          t_P12=1;t_P9=0;clockTick2();
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 71");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P10) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 72");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P12=0;t_P9=1;clockTick2();
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 73");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P10) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P12=0;t_P9=0;clockTick2();
          if ((t_P11) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 75");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P10) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 76");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P12=1;t_P9=1;clockTick2();
          if ((t_P11) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 77");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P10) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 78");
             $display("Actual Value is ", t_P10 );
             $display("Expected Value is ", 1 );
          end


      // ones catching

      cew_Test_Count=cew_Test_Count+1;
          t_P2=1; t_P3=0; #1;
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 82");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P2=1; t_P3=1; #1;
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 83");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P16=0;t_P4=1;clockTick1();
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 84");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P16=0;t_P4=0;clockTick1();
          if ((t_P15) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 85");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 1 );
          end

      t_P1=1; #1;
      t_P16=1; #1;
      t_P16=0; #1;
      t_P1=0; #1;
      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P15) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 90");
             $display("Actual Value is ", t_P15 );
             $display("Expected Value is ", 0 );
          end




      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #10 $finish();
   end

endmodule
