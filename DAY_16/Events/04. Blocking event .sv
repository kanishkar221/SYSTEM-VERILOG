module blocking_event;
  event BJT;
  initial begin
    $display($time,"\t triggering the event");
    -> BJT;
  end
  initial begin
    $display($time,"\t waiting for the event using wait");
    wait(BJT.triggered);
    $display($time,"\t event BJT is triggered using wait");
  end
  initial begin
    $display($time,"\t waiting for the event using @");
    @(BJT.triggered);
    $display($time,"\t event BJT is triggered using @");
  end
endmodule

// OUTPUT
       0	 triggering the event
       0	 waiting for the event using wait
       0	 event BJT is triggered using wait
       0	 waiting for the event using @
