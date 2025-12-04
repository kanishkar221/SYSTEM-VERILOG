class parent_class;
  bit [31:0] addr;
  function void disp_p();
    $display("Value of addr = %0h",addr);
  endfunction
endclass

class child_class extends parent_class;
  int id;
  function void disp_c();
    $display("Value of id = %0h",id);
  endfunction
endclass

module class_example;
  initial begin
    child_class c = new();
    c.addr = 5;
    c.id = 1;
    c.disp_p();
    c.disp_c();
  end
endmodule

// OUTPUT 
Value of addr = 5
Value of id = 1
    
  
