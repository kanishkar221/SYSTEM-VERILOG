module array_locator;
  int q[$] = '{1,2,3,4};     // initialised queue
  int queue[$];              // queue
  int d[] = '{9,8,7,3,4,6};  // initialized dynamic array
  int f[5] = '{4,6,7,5,7};   // fixed array 
  int count;
  initial begin
    $display("1",q.sum);
    $display("2",q.product);
    $display("3",q.min);
    $display("4",q.max);
    queue = (f.unique());
    $display("5",queue);
    queue = (d.find with(item > 3));
    $display("6",queue);
    queue = (d.find_index with(item > 3));
    $display("7",queue);
    queue = (d.find_index with(item > 99));
    $display("8",queue);
    queue = (d.find_first_index with(item==8));
    $display("9",queue);
    queue = (d.find_last with(item==4));
    $display("10",queue);
    queue = (d.find_last_index with(item==4));
    $display("11",queue);
    count = d.sum with((item>7)*32'd1);
    $display("12",count);
    count = d.sum with((item>7)*item);
    $display("13",count);
    count = d.sum with(item<8);
    $display("14",count);
    count = d.sum with((item<8)?item:0);
    $display("15",count);
  end
endmodule                       
            
