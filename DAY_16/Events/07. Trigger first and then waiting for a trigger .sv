module event_example;
  event e1;
  initial begin
    fork
      // Process 1,triggers the event
      begin
        #40;
        $display($time,"\t Triggering the event");
        ->e1;
      end
      // Process 2,wait for the event to trigger
      begin
        $display($time,"\t Waiting for the event to trigger");
        #60;
        @(e1.triggered);
        $display($time,"\t Event Triggered");
      end
    join
  end
  initial begin
    #100;
    $display($time,"\t Ending the simulation");
    $finish;
  end
endmodule

// OUTPUT
      0	 Waiting for the event to trigger
      40	 Triggering the event
      100	 Ending the simulation
