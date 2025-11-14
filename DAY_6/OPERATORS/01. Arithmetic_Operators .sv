module operators;
  int a = 22;
  int b = 2;
  initial begin
    $display("a+b = %0d", a+b);
    $display("a-b = %0d", a-b);
    $display("a*b = %0d", a*b);
    $display("a/b = %0d", a/b);
    $display("a%%b = %0d", a%b);
  end
endmodule
