class A;
  int a;
  int i;
  mailbox m;
  
  function new(mailbox m1);
    this.m = m1;
  endfunction
  
  task trans_data();
    for(i = 0;i<3;i++) begin
      a++;
      m.put(a);
      $display("[%0t] Transmitter:Value of a = %0d",$time,a);
      $display("No of messages in mailbox = %0d",m.num());
    end
    $display("----------------------------------------");
  endtask
endclass

module tb();
  A a1;
  mailbox main = new();
  initial begin
    a1 = new(main);
    repeat(2)begin
      a1.trans_data();
    end
  end
endmodule

// OUTPUT
[0] Transmitter:Value of a = 1
No of messages in mailbox = 1
[0] Transmitter:Value of a = 2
No of messages in mailbox = 2
[0] Transmitter:Value of a = 3
No of messages in mailbox = 3
------------------------------------
[0] Transmitter:Value of a = 4
No of messages in mailbox = 4
[0] Transmitter:Value of a = 5
No of messages in mailbox = 5
[0] Transmitter:Value of a = 6
No of messages in mailbox = 6
------------------------------------
