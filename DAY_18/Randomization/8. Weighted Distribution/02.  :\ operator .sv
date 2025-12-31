class myWorld;
  rand bit [3:0] value1;
  constraint m_var {value1 dist {1:/30, [2:5]:/60, 6:/40, 7:/20};}
endclass

module top;
  initial begin
    int i;
    myWorld world = new();
    $display("Output for :/ operator");
    $display("Occurence of '6' is more as '6' has more weight");
    for (int i=0;i<10;i++) begin
      void'(world.randomize());
      $display("[%0t] @ iteration %0d Value1 = %0d ",$time,i,world.value1);
    end
  end
endmodule

// OUTPUT
Output for :/ operator
Occurence of '6' is more as '6' has more weight
[0] @ iteration 0 Value1 = 1 
[0] @ iteration 1 Value1 = 2 
[0] @ iteration 2 Value1 = 5 
[0] @ iteration 3 Value1 = 6 
[0] @ iteration 4 Value1 = 3 
[0] @ iteration 5 Value1 = 6 
[0] @ iteration 6 Value1 = 6 
[0] @ iteration 7 Value1 = 6 
[0] @ iteration 8 Value1 = 7 
[0] @ iteration 9 Value1 = 7 
