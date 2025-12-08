virtual class A;
  int a,b,c;
  pure virtual function void disp(); // abstract function
  pure virtual task sum();           // abstract task
endclass

class B extends A;
  virtual function void disp();     // implement pure virtual function
    a = 10;
    $display("1.Value of a = %0d,b = %0d,c = %0d",a,b,c);
  endfunction
  virtual task sum();              // implement pure virtual task
    c = a + b;
    $display("2.Value of a = %0d,b = %0d,c = %0d",a,b,c);
  endtask
endclass
    
module pure_example;
  B b1;
  initial begin
    b1 = new();
    b1.disp();          //call disp a = 10
    b1.b = 12;          // assign b value is 35
    b1.sum();
  end
endmodule

// OUTPUT 
1.Value of a = 10,b = 0,c = 0
2.Value of a = 10,b = 12,c = 22
