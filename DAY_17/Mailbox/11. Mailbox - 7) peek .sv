class A;
  int a;
  int i;
  mailbox m;
  
  function new(mailbox m1);
    this.m = m1;
  endfunction
  
  task trans_data();
    for(i=0;i<1;i++)begin
      a++;
      m.put(a);
      $display("[%0t] 1.Transmitter:Value of a = %0d",$time,a);
    end
    $display("Put successful");
    $display("Messages in mailbox = %0d",m.num());
  endtask
endclass

class B;
  int a;
  int i;
  mailbox m;
  
  function new(mailbox m2);
    this.m = m2;
  endfunction
  
  task recei_data();
    for(i=0;i<2;i++)begin
      m.peek(a);
      $display("[%0t] Peeking value of a = %0d",$time,a);
      $display("Peek successful");
    end
    m.get(a);
    $display("[%0t] 2.Receiver:Value of a = %0d",$time,a);
    $display("Get successful");
    $display("Messages in mailbox = %0d",m.num());
  endtask
endclass

module tb();
  A a1;
  B b1;
  mailbox main = new(2);
  initial begin
    a1 = new(main);
    b1 = new(main);
    a1.trans_data();
    $display("-----------------------------------");
    b1.recei_data();
    $display("-----------------------------------");
    b1.recei_data();
    $display("End of program");
  end
endmodule

// OUTPUT
[0] 1.Transmitter:Value of a = 1
Put successful
Messages in mailbox = 1
-----------------------------------
[0] Peeking value of a = 1
Peek successful
[0] Peeking value of a = 1
Peek successful
[0] 2.Receiver:Value of a = 1
Get successful
Messages in mailbox = 0
-----------------------------------
