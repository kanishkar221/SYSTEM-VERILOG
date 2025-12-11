module disable_fork;
  initial begin
    $display("--------------------------------------------");
    fork
      // Process-1
      begin
        $display($time,"\t Process-1 of fork-1 Started");
        #5;
        $display($time,"\t Process-1 of fork-1 Finished");
      end
      // Process-2
      begin
        sub_process();
      end
    join_any
    disable fork;
    $display("------------------------------------------");
    $display($time,"\t After Disable Fork");
    $display("------------------------------------------");
  end
  // Sub-Process
  task sub_process;
    $display($time,"\t Sub-Process Started");
    #10;
    $display($time,"\t Sub-Process Finished");
  endtask
endmodule     

// OUTPUT
--------------------------------------------
    0	 Process-1 of fork-1 Started
    0	 Sub-Process Started
    5	 Process-1 of fork-1 Finished
------------------------------------------
    5	 After Disable Fork
------------------------------------------
