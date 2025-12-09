class parent;
  int a,b;
  int c;
  int d = 5;
  
  function int sum(int val_1, val_2);
    c = val_1 + val_2;
    return c;
  endfunction
  
  function void display();
    $display("Sum = %0d",c);
    $display("1.d = %0d",d);
  endfunction
endclass

class child extends parent;
  function void disp();
    $display("2.d = %0d",d);
  endfunction
endclass

module example;
  parent p;
  child c1;
  int e;
  initial begin
    p = new();
    c1 = new();
    e = p.sum(5,10);  // calling parent class method and passing argument as value and storing return value in e
    p.display();
    c1.d = 10;
    c1.disp();
  end
endmodule

// OUTPUT
Sum = 15
1.d = 5
2.d = 10
