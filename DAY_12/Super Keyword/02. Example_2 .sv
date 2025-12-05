class parent_class;
  string fan, switch;
  function void display();
    switch = "ON";
    $display("Switch is %s",switch);
  endfunction
endclass

class child_class extends parent_class;
  string fan = "ON";
  function void display();
    super.display();                // Here using super keyword we can get both display() methods
    $display("So fan is %s",fan);
  endfunction
endclass

module class_example;
  initial begin
    child_class c1 = new();
    c1.display();
  end
endmodule

// OUTPUT 
Switch is ON
So fan is ON
