class ParentClass;
  virtual function void display(input bit[7:0] data);
    $display("Parent:data = %0h",data);
  endfunction
endclass

class ChildClass extends ParentClass;
  function void display(input bit[7:0] data);
    $display("Child:data = %0h",data);
    super.display(data);
  endfunction
endclass

module example;
  initial begin
    ChildClass c1 = new();
    c1.display(8'hA5);
  end
endmodule

// OUTPUT 
Child:data = a5
Parent:data = a5
