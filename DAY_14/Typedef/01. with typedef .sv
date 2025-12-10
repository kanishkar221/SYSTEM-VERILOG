//typedef class c1;
typedef class c2;
  
// class 1
class c1; 
  c2 c;    // c2 is forward declared, so its valid
endclass

// class 2
class c2;
  c1 c;   // c1 is forward declared, so its valid
endclass

module typedef_example;
  initial begin
    c1 class1 = new();
    c2 class2 = new();
    $display("Inside Typedef");
  end
endmodule

// OUTPUT
Inside Typedef
