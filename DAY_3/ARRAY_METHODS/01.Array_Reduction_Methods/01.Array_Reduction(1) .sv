module array_reduction;
  int array[4] = '{2,6,8,4};
  initial begin
    $display("sum",array.sum);
    $display("product",array.product);
    $display("and",array.and);
    $display("or",array.or);
    $display("xor",array.xor);
  end
endmodule
