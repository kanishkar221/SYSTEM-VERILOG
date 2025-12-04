class data #(parameter int a = 4,type team = string);
  bit [a-1:0]d;
  team c;
  
  function new();
    d = 20;
    c = "Company";
  endfunction
  
  function void display();
    $display ("d = %0d,c = %0s",d,c);
  endfunction
endclass

module test;
  data #(4) p1;
  initial begin
    p1 = new();
    $display("Contents of p1");
    p1.display();
  end
endmodule

// OUTPUT
Contents of p1
d = 4,c = Company

