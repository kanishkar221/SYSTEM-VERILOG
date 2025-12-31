class items;
  rand bit [3:0] value1;
  constraint addr_mode1 {value1 > 5; value1 < 12;}
  constraint addr_mode2 {value1 > 6;}
endclass

module constraint_top;
  initial begin
    int i;
    items item = new();
    $display("Output for bidirectional constraint");
    $display("Constraint 1 & 2 limits the value to 7,8,9,10 and 11");
    for (int i = 1;i < 10; i++) begin
      void'(item. randomize());
      $display("[%0t] @ iteration %0d value1 = %0d",$time,i,item.value1);
    end
  end
endmodule

// OUTPUT
Output for bidirectional constraint
Constraint 1 & 2 limits the value to 7,8,9,10 and 11
[0] @ iteration 1 value1 = 9
[0] @ iteration 2 value1 = 8
[0] @ iteration 3 value1 = 10
[0] @ iteration 4 value1 = 10
[0] @ iteration 5 value1 = 10
[0] @ iteration 6 value1 = 8
[0] @ iteration 7 value1 = 11
[0] @ iteration 8 value1 = 7
[0] @ iteration 9 value1 = 7
