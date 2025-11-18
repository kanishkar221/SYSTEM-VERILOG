module square_function;
  function automatic int square(input int x);
    return x*x;
  endfunction
  
  initial begin
    int r;
    r = square(5);
    $display("Square of the function = %0d",r);
  end
endmodule
