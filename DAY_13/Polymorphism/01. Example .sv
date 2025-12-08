class parent_class;
  int a;
  int b;
  virtual function void display();
    a = 1;
    b = 2;
    $display("Parent Class");
    $display("a = %0d, b = %0d",a,b);
  endfunction
endclass

class child_1 extends parent_class;
  int c;
  int d;
  int e;
  function void display();
    a = 3;
    b = 4;
    e = a + b;
    $display("Child Class");
    $display("a = %0d,b = %0d,e = %0d",a,b,e);
  endfunction
endclass

class child_2 extends parent_class;
  int f;
  function void display();
    f = a*b;
    $display("f = %0d",f);
  endfunction
endclass

module polymorphism_example;
  parent_class p1 [1:0];
  child_1 c1;
  child_2 c2;
  initial begin
    c1 = new();
    p1[0] = c1;
    p1[1] = new();
    p1[0].display();
    p1[1].display();
  end
endmodule

// OUTPUT
Child Class
a = 3,b = 4,e = 7
Parent Class
a = 1, b = 2

