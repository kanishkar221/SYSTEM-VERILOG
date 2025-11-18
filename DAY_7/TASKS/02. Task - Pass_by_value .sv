module task_pass_by_value;
  int a, b;
  int out;

  task automatic add(int x, int y, output int result);
    x = x + y;      
    result = x;     
  endtask
  
  initial begin
    a = 10;
    b = 20;
    add(a, b, out); // pass-by-value (default)
    $display("Out = %0d | a = %0d | b = %0d", out, a, b);
  end
endmodule
