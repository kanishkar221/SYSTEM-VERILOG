module waitorder_ex;
  event e1;   // declaring event1
  event e2;   // declaring event2
  event e3;   // declaring event3
  
  initial begin
    fork
      //process-1, triggers the event e1
      begin
        #2;
        $display($time,"\t Triggering The Event e1");
        ->e1;
      end
      //process-2, triggers the event e2
      begin
        #4;
        $display($time,"\t Triggering The Event e2");
        ->e2;
      end
      //process-3, triggers the event e3
      begin
        #6;
        $display($time,"\t Triggering The Event e3");
        ->e3;
      end
      //process-4, wait for the events to trigger in order of e1,e3 and e2
      begin
        $display($time,"\t Waiting for the Event's to trigger");
//        wait_order(e1,e2,e3) // inorder
        wait_order(e1,e3,e2) // out of order
        $display($time,"\t Event's triggered Inorder");
        else
          $display($time,"\t Event's triggered Out-Of-Order");
      end
    join
  end
endmodule  

// OUTPUT
In order           0	 Waiting for the Event's to trigger
                   2	 Triggering The Event e1
                   4	 Triggering The Event e2
                   6	 Triggering The Event e3
                   6	 Event's triggered Inorder
  
Out-of-order       0	 Waiting for the Event's to trigger
                   2	 Triggering The Event e1
                   4	 Triggering The Event e2
                   4	 Event's triggered Out-Of-Order
                   6	 Triggering The Event e3 
