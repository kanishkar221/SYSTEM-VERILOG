class in_cons;
  rand bit [3:0] var1;
  constraint c1 {(var1 inside {[3:9]});}
endclass

module top;
  initial begin
    int i;
    in_cons c = new();
    $display ("Output for inside constraint");
    for (int i=1;i<7;i++) begin
      void'(c.randomize());
      $display("[%0t] @ iteration:%0d Var1 = %0d",$time,i,c.var1);
    end
  end
endmodule

// OUTPUT
Output for inside constraint
[0] @ iteration:1 Var1 = 9
[0] @ iteration:2 Var1 = 5
[0] @ iteration:3 Var1 = 8
[0] @ iteration:4 Var1 = 5
[0] @ iteration:5 Var1 = 9
[0] @ iteration:6 Var1 = 8
