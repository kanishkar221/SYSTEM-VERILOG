module dynamic_array;
  int array[];
  initial begin 
    array = new[5];
    array='{1,2,3,4,5};
    foreach (array[i])
      $display("array",i,array[i]);
    $display("Size of array ", array.size());
    array.shuffle();
    $display("After shuffling = %p",array);
  end
endmodule

