class base_class;    // method with virtual keyword
  virtual function void display();
    $display("Inside Base_Class");
  endfunction
endclass

class extended_class extends base_class;
  function void display();
    $display("Inside Extended_Class");
  endfunction
endclass

module virtual_example;
  initial begin
    base_class b_c;
    extended_class e_c;
    e_c = new();
    b_c = e_c;
    b_c.display();
  end
endmodule    

// OUTPUT
Inside Extended_Class
