// class 1
class c1;
  c2 c;
endclass

// class 2
class c2;
  c1 c;
endclass

module typedef_example;
  initial begin
    c1 class1;
    c2 class2;
    $display("Inside Typedef");
  end
endmodule

// OUTPUT
Compile error
