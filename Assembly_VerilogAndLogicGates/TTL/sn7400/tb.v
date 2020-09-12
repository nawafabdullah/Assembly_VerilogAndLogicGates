//================================================================--
// Design Unit  : cew testbench for sn7400
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
// Library      : sn7400 
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
   reg t_P1, t_P2, t_P4, t_P5, t_P9, t_P10, t_P12, t_P13;
   supply1 t_P14;
   supply0 t_P7;
   integer i;

   // Gold function returns x nand y
   function gold;
      input x;
      input y;

      gold=(x~&y);
   endfunction

   sn7400 cut(t_P1, t_P2, t_P3, t_P4, t_P5, t_P6, t_P7, t_P8, t_P9, t_P10, t_P11, t_P12, t_P13, t_P14);

   initial begin
      $dumpfile("test_bench.vcd");
      $dumpvars(0,test_bench);

      // note, gates are tested sequentially
      // also, 3 different styles of testing are shown


      // style 1 .. explicit enumeration
      cew_Test_Count=cew_Test_Count+1;
          t_P1=0;t_P2=0;#1;
          if ((t_P3) !== (t_P1 ~& t_P2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 59");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", t_P1 ~& t_P2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=0;t_P2=1;#1;
          if ((t_P3) !== (t_P1 ~& t_P2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 60");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", t_P1 ~& t_P2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=1;t_P2=0;#1;
          if ((t_P3) !== (t_P1 ~& t_P2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 61");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", t_P1 ~& t_P2 );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P1=1;t_P2=1;#1;
          if ((t_P3) !== (t_P1 ~& t_P2)) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 62");
             $display("Actual Value is ", t_P3 );
             $display("Expected Value is ", t_P1 ~& t_P2 );
          end


      // style 2 .. explicit enumeration with a gold function (oracal)
      cew_Test_Count=cew_Test_Count+1;
          t_P4=0;t_P5=0;#1;
          if ((t_P6) !== (gold(t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 65");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P4, t_P5) );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=0;t_P5=1;#1;
          if ((t_P6) !== (gold(t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 66");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P4, t_P5) );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=1;t_P5=0;#1;
          if ((t_P6) !== (gold(t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 67");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P4, t_P5) );
          end

      cew_Test_Count=cew_Test_Count+1;
          t_P4=1;t_P5=1;#1;
          if ((t_P6) !== (gold(t_P4, t_P5))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 68");
             $display("Actual Value is ", t_P6 );
             $display("Expected Value is ", gold(t_P4, t_P5) );
          end


      // style 3 .. implicit enumeration with a gold function (oracal)
      for (i=0; i<4; i=i+1)
        begin
        cew_Test_Count=cew_Test_Count+1;
          t_P9=i[1];t_P10=i[0];#1;
          if ((t_P8) !== (gold(t_P9, t_P10))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 73");
             $display("Actual Value is ", t_P8 );
             $display("Expected Value is ", gold(t_P9, t_P10) );
          end

        cew_Test_Count=cew_Test_Count+1;
          t_P13=i[1];t_P12=i[0];#1;
          if ((t_P11) !== (gold(t_P13, t_P12))) begin
             cew_Error_Count=cew_Error_Count+1;
             $display("\nTest Case ERROR (Ncase) in script at line number 74");
             $display("Actual Value is ", t_P11 );
             $display("Expected Value is ", gold(t_P13, t_P12) );
          end

        end
 
      $display("\n**********Summary**********\n");
          $display("Total number of test cases = %d \n", cew_Test_Count);
          $display("Total number of test cases in error = %d \n", cew_Error_Count);

      #1 $finish();
   end

endmodule

