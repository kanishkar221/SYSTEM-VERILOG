module function_pass_by_value;
  int a, b;
  int out;
  function int add(int x, y);
    x = x + y;
    return x;
  endfunction
  initial begin
    a = 10;
    b = 20;
    out = add(a, b);
    $display("Out = %0d | a = %0d | b = %0d", out, a, b);
  end
endmodule
