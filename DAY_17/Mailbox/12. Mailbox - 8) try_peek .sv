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
      $display("[%0t] 1.Transmission:Value of a = %0d",$time,a);
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
      if(m.try_peek(a)) begin
        $display("[%0t] Peeking value of a = %0d",$time,a);
        $display("Peek Successful");
      end
      else begin
        $display("Peek failed as mailbox is empty");
        return;
      end
    end
    m.get(a);
    $display("Receiver:Value of a = %0d",a);
    $display("Get successful");
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
    $display("-------------------------------------");
    b1.recei_data();
    $display("-------------------------------------");
    b1.recei_data();
    $display("End of Program");
  end
endmodule

// OUTPUT
[0] 1.Transmission:Value of a = 1
Put successful
Messages in mailbox = 1
-------------------------------------
[0] Peeking value of a = 1
Peek Successful
[0] Peeking value of a = 1
Peek Successful
Receiver:Value of a = 1
Get successful
-------------------------------------
Peek failed as mailbox is empty
End of Program
