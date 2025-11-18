module function_pass_by_reference;
  int a,b;
  int out;
  
  function automatic int add(ref int x, ref int y);
    x = x + y; // update global variable
    return x;
  endfunction
  
  initial begin
    a = 10;
    b = 20;
    out = add(a,b);
    $display("Out = %0d | a = %0d | b = %0d",out,a,b); // a=30 is updated value
  end
endmodule
