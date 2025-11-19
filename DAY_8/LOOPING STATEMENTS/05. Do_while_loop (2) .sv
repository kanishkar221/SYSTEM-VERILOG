module do_while_loop;
  int count;
  initial begin
    $display("Value of count outside the loop = %0d",count);
    while(count<0)
      begin
        count++;
        $display("Value of count inside the loop = %0d",count);
      end
  end
endmodule

// OUTPUT:Value of count outside the loop = 0

module do_while_loop;
  int count;
  initial begin
    $display("Value of count outside the loop = %0d",count);
    do begin
      $display("Value of count inside the loop = %0d",count);
      count++;
    end
    while(count<0);
  end
endmodule

//OUTPUT : Value of count outside the loop = 0
//OUTPUT : Value of count inside the loop = 0

