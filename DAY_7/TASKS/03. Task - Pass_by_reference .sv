module task_pass_by_reference;
  int a, b;
  int out;

  task automatic add(ref int x, ref int y, output int result);
    x = x + y;        
    result = x;       
  endtask
  
  initial begin
    a = 10;
    b = 20;
    add(a, b, out);   
    $display("Out = %0d | a = %0d | b = %0d", out, a, b);
  end
endmodule
