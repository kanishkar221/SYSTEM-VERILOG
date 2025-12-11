module disable_fork;
  initial begin
    $display("------------------------------------------------------");
    // fork 1
    fork
      // Process 1
      begin
        $display($time,"\t Process-1 of fork-1 Started");
        #5;
        $display($time,"\t Process-1 of fork-1 Finished");
      end
      // Process 2
      begin
        $display($time,"\t Process-2 of fork-1 Started");
        #20;
        $display($time,"\t Process-2 of fork-1 Finished");
      end
    join_any
    // fork 2
    fork
      // Process 1
      begin
        $display($time,"\t Process-1 of fork-2 Started");
        #5;
        $display($time,"\t Process-1 of fork-2 Finished");
      end
      // Process 2
      begin
        $display($time,"\t Process-2 of fork-2 Started");
        #20;
        $display($time,"\t Process-2 of fork-2 Finished");
      end
    join_none
    disable fork;
    $display("------------------------------------------------------");
    $display($time,"\t After Disable Fork");
    $display("------------------------------------------------------");
  end
endmodule

// OUTPUT
------------------------------------------------------
    0	 Process-1 of fork-1 Started
    0	 Process-2 of fork-1 Started
    5	 Process-1 of fork-1 Finished
------------------------------------------------------
    5	 After Disable Fork
------------------------------------------------------
