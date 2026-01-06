// with using soft constraint
class pack;
  rand bit [3:0] a;
  constraint addr_a {a > 5;}
endclass

module soft_with_conflict;
  pack c;
  initial begin
    c = new();
    $display("Output of soft with conflict");
    
    for(int i=0;i<5;i++) begin
      void'(c.randomize()with {a < 5;});
      $display("a = %0d value = %0d",i,c.a);
    end
    
    c = new();
    $display("Using soft constraint to solve conflict issue");
    
    for(int i=0;i<5;i++) begin
      void'(c.randomize()with{soft a < 5;});
      $display("a = %0d value = %0d",i,c.a);
    end
  end
endmodule

// OUTPUT
Output of soft with conflict
a = 0 value = 0
a = 1 value = 0
a = 2 value = 0
a = 3 value = 0
a = 4 value = 0
Using soft constraint to solve conflict issue
a = 0 value = 11
a = 1 value = 9
a = 2 value = 7
a = 3 value = 6
a = 4 value = 9
