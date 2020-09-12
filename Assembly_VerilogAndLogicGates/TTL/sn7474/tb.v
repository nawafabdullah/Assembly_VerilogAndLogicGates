//================================================================--
// Design Unit  : cew testbench for sn7474
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

   wire t_P5, t_P6, t_P8, t_P9;
   reg t_P1, t_P2, t_P3, t_P4, t_P7, t_P10, t_P11, t_P12, t_P13, t_P14;

   sn7474 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14);

   task clockTick1; // nasty syntax but task body can only be one (compound) statement
      begin
         t_P3=0; #3;
         t_P3=1; #6;
         t_P3=0; #3;
      end
   endtask

   task clockTick2;
      begin
         t_P11=0; #3;
         t_P11=1; #6;
         t_P11=0; #3;
      end
   endtask


   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      t_P14=1; t_P7=0; 
      
      // Async Operation

      cew_Test_Count=cew_Test_Count+1;
          t_P1=1; t_P4=0; #1; t_P4=1; #1;
          if ((t_P5) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 53");
             $display("Actual Value is ", t_P5 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 54");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P1=0; t_P4=1; #1; t_P1=1; #1;
          if ((t_P5) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 56");
             $display("Actual Value is ", t_P5 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 57");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P13=1; t_P10=0; #1; t_P10=1; #1;
          if ((t_P9) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_P9 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P13=0; t_P10=1; #1; t_P13=1; #1;
          if ((t_P9) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 62");
             $display("Actual Value is ", t_P9 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 63");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end



      // Normal Operation
      
      t_P1=1; t_P4=1; t_P10=1; t_P13=1; 

      cew_Test_Count=cew_Test_Count+1;
          t_P2=1;clockTick1();
          if ((t_P5) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 70");
             $display("Actual Value is ", t_P5 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 71");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P12=1;clockTick2();
          if ((t_P9) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 73");
             $display("Actual Value is ", t_P9 );
             $display("Expected Value is ", 1 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 0 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P2=0;clockTick1();
          if ((t_P5) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 76");
             $display("Actual Value is ", t_P5 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P6) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 77");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", 1 );
          end


      cew_Test_Count=cew_Test_Count+1;
          t_P12=0;clockTick2();
          if ((t_P9) !== (0)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 79");
             $display("Actual Value is ", t_P9 );
             $display("Expected Value is ", 0 );
          end

      cew_Test_Count=cew_Test_Count+1;
          
          if ((t_P8) !== (1)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 80");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", 1 );
          end




      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

