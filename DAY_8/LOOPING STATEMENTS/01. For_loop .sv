module for_loop;
  int array[10];
  
  initial begin
    for (int i = 0; i < 10; i++) begin //Update array
      array[i] = 10*i;
    end
    for (int i = 0; i < 10; i++) begin //Display array elements
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule
