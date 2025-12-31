class basic;
  rand bit [3:0] value1;
  rand bit [2:0] value2;
  constraint c_var {
    if (value1 inside {[4'h3:4'h9]})
      value2 == 1;
    else
      value2 == 0;
  }
endclass

module top;
  int i = 1;
  initial begin
    basic c = new();
    $display("Output for if-else constraint");
    $display("If the value1 lies between 3 to 9 , then value2 will be 1;Otherwise, it will be 0");
    for (int i=0;i<5;i++) begin
      void'(c.randomize());
      $display("[%0t] @ iteration %0d value1 = %0d, value2 = %0d",$time,i,c.value1, c.value2);
    end
  end
endmodule

// OUTPUT
Output for if-else constraint
If the value1 lies between 3 to 9 , then value2 will be 1;Otherwise, it will be 0
[0] @ iteration 0 value1 = 13, value2 = 0
[0] @ iteration 1 value1 = 5, value2 = 1
[0] @ iteration 2 value1 = 4, value2 = 1
[0] @ iteration 3 value1 = 0, value2 = 0
[0] @ iteration 4 value1 = 13, value2 = 0
