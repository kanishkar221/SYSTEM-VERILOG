module array;
  int array [];
  initial begin 
    array=new[6];
    array='{10,20,30,40,50,60};
    foreach(array[i])
      $display("array[%0d]=%0d",i,array[i]);
    $display("size of array=%0d",array.size());
    
    array=new[8](array);
    $display("size of array after resizing = %0d",array.size());
    foreach(array[i])
      $display("array[%0d]=%0d",i,array[i]);
    
    array=new[5];
    $display("size of array after overriding = %0d",array.size());
    foreach(array[i])
      $display("array[%0d]=%0d",i,array[i]);
    
    array.delete();
    $display("Size of array after deleting=%0d",array.size());
  end
endmodule

    
