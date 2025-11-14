module operators;
  logic [3:0] a, b, c, y;
  initial begin 
    a = 4'b1101;
    b = 4'b1001;
    c = 4'b1101;

    $display("Value of the a is %0b", a);
    $display("Value of the b is %0b", b);
    $display("Value of the c is %0b", c);

    y = (a == b);
    $display("Output of logical equality operator of a==b is %0b", y);
   
    y = (a != b);
    $display("Output of logical inequality operator of a!=b is %0b", y);

    y = (a === c);
    $display("Output of case equality operator of a===c is %0b", y);

    y = (a !== c);
    $display("Output of case inequality operator of a!==c is %0b", y);
  end
endmodule
