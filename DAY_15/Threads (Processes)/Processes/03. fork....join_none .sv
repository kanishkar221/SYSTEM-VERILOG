module fork_join_none;
  initial begin
    $display("-----------------------------------------------------");
    fork
      // Processes 1
      begin
        $display($time,"\tProcesses 1 started");
        #5;
        $display($time,"\tProcesses 1 finished");
      end
      // Processes 2
      begin
        $display($time,"\tProcesses 2 started");
        #20;
        $display($time,"\tProcesses 2 finished");
      end
    join_none
    
    $display($time,"\tOutside fork-join");
    $display("-----------------------------------------------------");
  end
endmodule

// OUTPUT
-----------------------------------------------------
    0	Outside fork-join
-----------------------------------------------------
    0	Processes 1 started
    0	Processes 2 started
    5	Processes 1 finished
    20	Processes 2 finished
