module semaphore_example;
  semaphore sem = new(6); // create semaphore with 6 keys
  initial begin
    $display("First initial block at time = [%0t]",$time);
    sem.get(4);   // Take 4 keys from semaphore
    $display("Thread 1:Accessing 4 keys from semaphore at time = [%0t]",$time);
    #5; 
    sem.put(2);   // Put back 2 keys into semaphore
    $display("Thread 1:Done using 2 keys at time = [%0t]",$time);
    #20;
    $display("Thread 1:Still using the remaining 2 keys at time = [%0t]",$time);
  end
  
  initial begin
    $display("Second initial block at time = [%0t]",$time);
    sem.get(5);    // Take 5 keys from semaphore, blocks if not available
    $display("Thread 2:Accessing 5 keys from semaphore at time = [%0t]",$time);
    #5;
    sem.put(5);    // Put back 5 keys into semaphore
    $display("Thread 2:Done using 5 keys at time = [%0t]",$time);
  end
endmodule

// OUTPUT
First initial block at time = [0]
Thread 1:Accessing 4 keys from semaphore at time = [0]
Second initial block at time = [0]
Thread 1:Done using 2 keys at time = [5]
Thread 1:Still using the remaining 2 keys at time = [25]
