class parent_class;      // with use $cast  
  bit [31:0] addr;
  function void display();
    $display("Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;
  function void display();
    super.display();
    $display("Data = %0d",data);
  endfunction
endclass

module example;
  parent_class p;
  child_class c = new();
  child_class c1;
  initial begin
    c.addr = 5;
    c.data = 7;
    p = c;       // assign child class to parent class are allowed
    $cast(c1,p);  // with the use of $cast, type check will occur during runtime 
//    c1 = p;      // type check fails during compile time
    c.display();
  end
endmodule    

// OUTPUT
Addr = 5
Data = 7
