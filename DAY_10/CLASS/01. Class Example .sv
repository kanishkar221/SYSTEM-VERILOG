// CODE
class sv_class;
  int x;          // class properties
  task set(int i);
    x = i;
  endtask
  function int get();
    return x;
  endfunction
endclass

// TESTBENCH 
module tb;
  sv_class class_1;
  initial begin
    sv_class class_2 = new();
    class_1 = new();
    class_1.set(10);
    class_2.set(20);
    $display("Class_1:Value of x = %0d",class_1.get()); // 10
    $display("Class_2:Value of x = %0d",class_2.get()); // 20
  end
endmodule

// OUTPUT
Class_1:Value of x = 10
Class_2:Value of x = 20
 
  
