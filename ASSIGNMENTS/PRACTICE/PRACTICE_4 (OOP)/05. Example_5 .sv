// Implement a clone method in a class to perform a deep copy 
class MyClass;
  int data;
  MyClass nested;
  
  function new (int d,MyClass n = null); // Constructor
    data = d;
    nested = n;
  endfunction
  
  function MyClass clone();   // Deep copy clone method
    MyClass copy = new(data);
    if(nested != null)
      copy.nested = nested.clone(); // Recursive clone nested classes
    return copy;
  endfunction
endclass

module example;
  initial begin
    MyClass obj2 = new(200);
    MyClass obj1 = new(100,obj2);
    MyClass c = obj1.clone();        // call clone
    $display("Original data = %0d",obj1.data);
    $display("Original nested data = %0d",obj1.nested.data);
    $display("Cloned data = %0d",c.data);
    $display("Cloned nested data = %0d",c.nested.data);
  end
endmodule

// OUTPUT 
Original data = 100
Original nested data = 200
Cloned data = 100
Cloned nested data = 200
