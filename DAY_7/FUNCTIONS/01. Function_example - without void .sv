module function_example;
  function int add(input int a, b);
    add = a + b;   // return value
  endfunction
  initial begin
    int result;
    result = add(10, 20);
    $display("Addition = %0d", result);
  end
endmodule
