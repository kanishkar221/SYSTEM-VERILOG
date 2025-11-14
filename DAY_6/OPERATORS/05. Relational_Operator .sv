module operator;
  int a = 10;
  int b = 20;
  initial begin
    $display("a<b = %0d", a<b);
    $display("a>b = %0d", a>b);
    $display("a<=b = %0d", a<=b);
    $display("a>=b = %0d", a>=b);
  end
endmodule
