class operator;
  rand bit [2:0] value1;
  rand bit [3:0] value2;
  constraint c_mode {(value1 inside {[1:5]}) -> (value2 < 8);}
endclass

module top;
  initial begin
    int i;
    operator c = new();
    $display("Output for implication constraint");
    for (int i=0;i<10;i++) begin
      void'(c.randomize());
      $display("[%0t] @ iteration %0d value1 = %0d, value2 = %0d", $time,i,c.value1, c.value2);
    end
  end
endmodule

// OUTPUT
Output for implication constraint
[0] @ iteration 0 value1 = 3, value2 = 6
[0] @ iteration 1 value1 = 7, value2 = 11
[0] @ iteration 2 value1 = 6, value2 = 2
[0] @ iteration 3 value1 = 7, value2 = 5
[0] @ iteration 4 value1 = 1, value2 = 3
[0] @ iteration 5 value1 = 6, value2 = 1
[0] @ iteration 6 value1 = 6, value2 = 1
[0] @ iteration 7 value1 = 7, value2 = 0
[0] @ iteration 8 value1 = 7, value2 = 0
[0] @ iteration 9 value1 = 7, value2 = 6
