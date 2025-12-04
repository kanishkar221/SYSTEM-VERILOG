class company #(parameter branch = 3,employee = 2);
  bit [branch-1:0] b1;
  bit [employee-1:0] b2;
  
  function new();
    b1 = 'd3;
    b2 = 'd2;
  endfunction
  
  function void display();
    $display("b1 = %0d,b2 = %0d",b1,b2);
  endfunction
endclass

module value;
  company #(3,2)m;
  initial begin
    m = new();
    $display("Contents of m");
    m.display();
  end
endmodule
    
// OUTPUT 
Contents of m
b1 = 3,b2 = 2
