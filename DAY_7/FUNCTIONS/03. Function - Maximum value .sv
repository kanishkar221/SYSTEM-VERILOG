module function_example;
  function int max_value(input int a, input int b);
    if(a>b)
      max_value = a;
    else
      max_value = b;
  endfunction
  initial begin
    int r;
    r = max_value(15,12);
    $display("Maximum = %0d",r);
  end
endmodule
