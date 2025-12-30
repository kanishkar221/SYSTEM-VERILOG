class class_queue;
  rand bit [5:0] que[$];        // 6 bit random elements
  // Constraint : Ensure the queue size is exactly 5
  constraint que_const {que.size() == 5;}
endclass

module mod;
  class_queue pack = new();    // Create an instance
  initial begin
    void'(pack.randomize());
    for (int i=0;i<pack.que.size();i++) begin
      $display("Iteration = %0d, Value of array = %0d", i,pack.que[i]);
    end
  end
endmodule

// OUTPUT
Iteration = 0, Value of array = 2
Iteration = 1, Value of array = 29
Iteration = 2, Value of array = 42
Iteration = 3, Value of array = 26
Iteration = 4, Value of array = 63
