class A;
  int a;
  int i;
  mailbox m;
  
  function new(mailbox m1);
    this.m = m1;
  endfunction
  
  task trans_data();
    for (i=0;i<4;i++)begin
      a++;
      m.put(a);
      $display("[%0t] 1.Transmitter:Value of a = %0d",$time,a);
    end
    $display("Put successful");
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
    repeat(5) begin
      if(m.try_get(a))
        $display("[%0t] 2.Receiver:Value of a = %0d",$time,a);
      else
        $display("Failed while getting the value as mailbox is empty");
    end
    $display("Get successfull");
  endtask
endclass

module tb();
  A a1;
  B b1;
  mailbox main = new(4);
  initial begin
    a1 = new(main);
    b1 = new(main);
    repeat(2)begin
      a1.trans_data();
      $display("--------------------------------------");
      b1.recei_data();
    end
  end
endmodule

// OUTPUT
[0] 1.Transmitter:Value of a = 1
[0] 1.Transmitter:Value of a = 2
[0] 1.Transmitter:Value of a = 3
[0] 1.Transmitter:Value of a = 4
Put successful
--------------------------------------
[0] 2.Receiver:Value of a = 1
[0] 2.Receiver:Value of a = 2
[0] 2.Receiver:Value of a = 3
[0] 2.Receiver:Value of a = 4
Failed while getting the value as mailbox is empty
Get successfull
[0] 1.Transmitter:Value of a = 5
[0] 1.Transmitter:Value of a = 6
[0] 1.Transmitter:Value of a = 7
[0] 1.Transmitter:Value of a = 8
Put successful
--------------------------------------
[0] 2.Receiver:Value of a = 5
[0] 2.Receiver:Value of a = 6
[0] 2.Receiver:Value of a = 7
[0] 2.Receiver:Value of a = 8
Failed while getting the value as mailbox is empty
Get successfull
