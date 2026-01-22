// 02. Mention the event at which the covergroup should be sampled
module using_event;
  bit [1:0] a;   // 2 bit variable to be covered
  event e;       // event used to trigger the covergroup
  
  // Define a covergroup that sample when the event e is triggered
  covergroup cgrp @ (e.triggered);
    c1 : coverpoint a;
  endgroup
  
  cgrp cg;  // Instance of covergroup
  
  initial begin
    cg = new();
    
    repeat (5) begin
      -> e;         // Trigger the event
      a = $random;  
      
      // Display current value annd coverage percentage
      $display("a=%0d ; coverage = %0.2f", a, cg.get_inst_coverage());
    end
  end
endmodule
