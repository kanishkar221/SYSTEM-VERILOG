module mixed_array;
  bit [3:0] array[2:0][2:0];
  initial begin
    array = '{'{4'h1,4'h2,4'h3},'{4'h4,4'h5,4'h6},'{4'h7,4'h8,4'h9}};
    foreach (array[i,j])
      $display("array[%0d][%0d] = %0h",i,j,array[i][j]);
  end
endmodule
