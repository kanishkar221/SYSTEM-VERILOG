class parent_class;     // with using super keyword   
  bit[31:0] data;
  function void display();
    $display("Value of data = %0h",data);
  endfunction
endclass

class child_class extends parent_class;
  bit[31:0] data;
  function void display();
    super.data = 3;
    super.display();
    $display("Value of data = %0h",data);
  endfunction
endclass

module class_example;
  initial begin
    child_class c1 = new();
    c1.data  =5;
    c1.display();
  end
endmodule

// OUTPUT
Value of data = 3
Value of data = 5
============================================================

class parent_class;      // without using super keyword
  bit[31:0] data;
  function void display();
    $display("Value of data = %0h",data);
  endfunction
endclass

class child_class extends parent_class;
  bit[31:0] data;
  function void display();
    $display("Value of data = %0h",data);
  endfunction
endclass

module class_example;
  initial begin
    child_class c1 = new();
    c1.data  =5;
    c1.display();
  end
endmodule

// OUTPUT
	Value of data = 5
    
