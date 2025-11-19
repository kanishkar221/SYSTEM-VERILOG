module do_while_loop;
  int count;
  initial begin
    do begin
      $display("Value of count = %0d",count);
      count++;
    end
    while (count<5);
  end
endmodule

OUTPUT:
  Value of count = 0
  Value of count = 1
  Value of count = 2
  Value of count = 3
  Value of count = 4
