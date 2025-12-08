virtual class A;
  int a = 5;
  function void disp();
    $display("Value of a = %0d",a);
  endfunction
endclass

class B extends A;
  int a = 6;    // this is NOT overriding, it is "variable hiding"   
  function void display();
    $display("Value of a = %0d",a);
  endfunction
endclass

module example;
  B b1;
  initial begin
    b1 = new();
    b1.a = 10;   // a becomes 10, replacing 6.
    b1.disp();
    b1.display();
  end
endmodule

// OUTPUT
Value of a = 5
Value of a = 10
