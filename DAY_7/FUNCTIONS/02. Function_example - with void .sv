module function_example;
    function void add(input int a, input int b);
      int sum;
      sum = a + b;
      $display("Addition = %0d", sum);
    endfunction

    initial begin
        int result;
      add(10, 20);  //Function call only, no return value
      //result = add(10,20);  //ERROR — void functions return nothing
    end
endmodule
