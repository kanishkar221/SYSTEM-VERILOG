class parent_class;
  bit [31:0] addr;
  function display();
    $display("Addr = %0d",addr);
  endfunction
endclass

class child_class extends parent_class;
  bit [31:0] data;;
  function display();
    $display("Data = %0d",data);
  endfunction
endclass

module example;
  child_class c = new();
  initial begin
    c.addr = 10;
    c.data = 20;
    c.display();
  end
endmodule

// OUTPUT
Data = 20
