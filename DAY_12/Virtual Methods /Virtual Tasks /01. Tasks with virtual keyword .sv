class packet;  // with virtual keyword
  string a;
  int b;
  virtual task display();
    a = "Team";
    b = 4;
    $display("a = %s",a);
    $display("b = %0d",b);
  endtask
endclass

class pack extends packet;
  string c;
  int d;
  task display();
    c = "RKS";
    d = 5;
    $display("c = %s",c);
    $display("d = %0d",d);
  endtask
endclass

module virtual_task;
  packet p1;
  pack p2;
  initial begin
    p2 = new();
    p1 = p2;
    $display("Contents of p1");
    p1.display();
  end
endmodule    

// OUTPUT
Contents of p1
c = RKS
d = 5
