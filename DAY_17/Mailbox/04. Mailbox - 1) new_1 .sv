class A;
  int a;
  int i;
  mailbox m;
  function new(mailbox m1);
    this.m = m1;
  endfunction
  
  task check();
    if(m == null)begin
      $display("Mailbox is not corrected");
    end
    else
      $display("Mailbox is created");
    for(i=0;i<3;i++)begin
      a++;
      m.put(a);
      $display("Value of a = %0d",a);
    end
  endtask
endclass

module tb();
  A a1;
  mailbox main = new(3);
  initial begin
    a1 = new(main);
	a1.check();
  end
endmodule

// OUTPUT
Mailbox is created
Value of a = 1
Value of a = 2
Value of a = 3
