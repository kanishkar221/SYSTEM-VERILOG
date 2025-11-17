module operators;
  logic [7:0] data;
  initial begin
    data = 8'hFF;
    
    if (data ==? 8'b11xx_z1xx)     // Wild equality
      $display("Data matches %b", data);
    else
      $display("Data does not match %b", data);
    
    if (data !=? 8'b1xzx_z1x0)    // Wild non-equality
      $display("Data does not match  %b", data);
    else 
      $display("Data matches with %b", data);

    $finish;
  end
endmodule
