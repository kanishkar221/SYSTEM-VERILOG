// without conflict
class class1;     
  rand bit [3:0] a;
  constraint c1 {a < 10;}
  constraint c2 {a > 5;}
endclass

module conflict;
  class1 c = new();
  initial begin
    if (c.randomize()) begin
      $display("Randomize Successfully");
      $display("Randomize value of a = %0d",c.a);
    end
    else begin
      $display("Randomize fail because conflict occurs");
      $display("Value of a = %0d",c.a);
    end
  end
endmodule 

// OUTPUT
Randomize Successfully
Randomize value of a = 9
