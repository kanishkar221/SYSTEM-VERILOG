// inline constraint along with class constraint
class generator;
  rand bit [2:0] value;   // 3 bit random variable
  // Constraint:Ensure value is always greater than 2
  constraint cons {value > 2;}
endclass

module inline_constraint();
  generator c = new();
  initial begin
    // Perform randomization using class constraint
    void'(c.randomize());
    #1 $display("\t[%0t] Iteration:1 value:%0d",$time,c.value);
    // Apply inline constraint to force value to 7
    void'(c.randomize()with{value == 7;});
    #1 $display("\t[%0t] Iteration:2 value:%0d",$time,c.value);
  end
endmodule

// OUTPUT
[1] Iteration:1 value:5
[2] Iteration:2 value:7
// The initial constraint in class is value >2 so its first iteration value is in the range of 2 to 7. 
// But in the second iteration giving value must be 7 from inline so the value is 7.

