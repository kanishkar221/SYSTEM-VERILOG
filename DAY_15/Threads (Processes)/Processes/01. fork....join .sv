module fork_join;
  initial begin
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
    join
    $display($time,"\tOutside fork-join");
    $finish;
  end
endmodule

// OUTPUT
  0	Processes 1 started
  0	Processes 2 started
  5	Processes 1 finished
  20	Processes 2 finished
  20	Outside fork-join
