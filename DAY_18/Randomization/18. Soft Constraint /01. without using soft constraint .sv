// without using soft constraint
class pack;
  rand bit [3:0] a;
  constraint addr_a {a > 5;}
endclass

module soft_without_conflict;
  pack c;
  initial begin
    c = new();
    $display("Without using soft constraint output");
    
    for(int i=0;i<5;i++) begin
      void'(c.randomize());
      $display("a = %0d value = %0d",i,c.a);
    end
    
    c = new();
    $display("Output without conflict");
    
    for(int i=0;i<5;i++) begin
      void'(c.randomize()with{a<10;});
      $display("a = %0d value = %0d",i,c.a);
    end
  end
endmodule

// OUTPUT
Without using soft constraint output
a = 0 value = 14
a = 1 value = 10
a = 2 value = 12
a = 3 value = 13
a = 4 value = 12
Output without conflict
a = 0 value = 8
a = 1 value = 6
a = 2 value = 7
a = 3 value = 7
a = 4 value = 7
