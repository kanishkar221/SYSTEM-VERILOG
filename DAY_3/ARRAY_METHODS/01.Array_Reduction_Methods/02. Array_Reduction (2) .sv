module array_reduction;
  int array[4] = '{1,2,3,4};
  int sum;
  initial begin
    foreach (array[i])
      array[i] = i;
    $display("sum",array.sum);
    $display("product",array.product);
    $display("or",array.or);
    $display("and",array.and);
    $display("xor",array.xor);
    sum=array.sum;
    $display("sum",sum);
  end
endmodule
