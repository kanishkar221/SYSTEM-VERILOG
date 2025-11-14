module operators;
  logic [0:3] a,b,c;
  int x;
  initial begin
    a = 4'b1001;   
    b = 4'b0110; 
    c = 4'b1111;
    $display("Value of a is %0b",a);
    $display("Value of b is %0b",b);
    $display("Value of c is %0b",c);
    x = {a,b,c};
    $display("Output of Concatenation operators %0b",x);
    x = {a,{2{b}},c};
    $display("Output of Replication operators %0b",x);
  end
endmodule
