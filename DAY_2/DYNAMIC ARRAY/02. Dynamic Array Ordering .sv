module array;
  int array[] = '{9,5,7,3,8,2,1};
  initial begin
    $display("size ",array.size());
    array.reverse();
    $display(array);
    array.sort();
    $display(array);
    array.rsort();
    $display(array);
    array.shuffle();
    $display(array);
    array.delete();
    $display(array);
    $display("size ",array.size());
  end
endmodule
