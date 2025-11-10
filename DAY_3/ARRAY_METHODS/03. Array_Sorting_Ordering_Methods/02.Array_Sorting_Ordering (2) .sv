module array_methods;
  int array[7] = '{2,7,5,8,1,9,4};
  initial begin
    array.reverse();
    $display("reverse:%p",array);
    array.sort();
    $display("sort:%p",array);
    array.rsort();
    $display("rsort:%p",array);
    for (int i = 0; i<5 ; i++) begin
      array.shuffle();
      $display("shuffle: %p",array);
    end
  end
endmodule
    
