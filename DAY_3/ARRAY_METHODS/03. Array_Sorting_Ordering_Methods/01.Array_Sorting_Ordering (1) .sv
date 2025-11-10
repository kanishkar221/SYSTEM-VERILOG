module array_methods;
  int array[7] = '{2,7,5,8,1,9,4};
  initial begin
    array.reverse();
    $display("reverse:%p",array);
    array.sort();
    $display("sort:%p",array);
    array.rsort();
    $display("rsort:%p",array);
    array.shuffle();
    $display("shuffle: %p",array);
  end
endmodule
  
