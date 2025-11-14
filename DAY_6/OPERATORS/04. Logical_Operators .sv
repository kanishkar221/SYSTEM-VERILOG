module operator;
  logic [7:0] a,b,x,y,z;
  initial begin
    a = 4'b1010;
    b = 4'b1000;
    $display("Value of a %0b",a);
    $display("Value of b %0b",b);
    x = a && b;
    $display("Value of logical and operator %0b",x);
    y = a || b;
    $display("Value of logical or operator %0b",y);
    z = !b;
    $display("Value of logical negation %0b",z);
  end
endmodule
