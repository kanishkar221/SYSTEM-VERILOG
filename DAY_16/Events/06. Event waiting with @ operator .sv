module event_example;
  event e1;
  initial begin
    fork
      // Process 1
      begin
        #40;
        $display($time,"\t Triggering the event");
        ->e1;
      end
      // Process 2
      begin
        $display($time,"\t Waiting for the event to trigger");
        @(e1.triggered);
        $display($time,"\t Event triggered");
      end
    join
  end
endmodule

// OUTPUT
      0	 Waiting for the event to trigger
      40	 Triggering the event
      40	 Event triggered
