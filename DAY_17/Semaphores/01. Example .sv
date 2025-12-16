module semaphore_example;
  semaphore sem = new(6);
  initial begin
    $display("First initial block at time = [%0t]",$time);
    sem.get(4);
    $display("Thread 1:Accesing 4 keys from semaphore at time = [%0t]",$time);
    #5;
    sem.put(4);
    $display("Thread 1:Done using 4 keys at time = [%0t]",$time);
  end
  initial begin
    $display("Second initial block at time = [%0t]",$time);
    sem.get(2);
    $display("Thread 2:Accessing 2 keys from semaphore at time = [%0t]",$time);
    #10;
    sem.put(2);
    $display("Thread 2:Done using 2 keys at time = [%0t]",$time);
  end
endmodule

// OUTPUT
First initial block at time = [0]
Thread 1:Accesing 4 keys from semaphore at time = [0]
Second initial block at time = [0]
Thread 2:Accessing 2 keys from semaphore at time = [0]
Thread 1:Done using 4 keys at time = [5]
Thread 2:Done using 2 keys at time = [10]
