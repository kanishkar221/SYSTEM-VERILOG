// inline conflict with class constraint
class generator;
  rand bit [2:0] value;   // 3 bit random variable
  // Constraint: Force value to always be 5 
  constraint cons {value == 5;};
endclass

module inline_conflict();
  generator c = new();
  int check;
  initial begin
    // Loop to perform randomization twice
    for(int i=1;i<=2;i++) begin
      // pply an inline constraint to force value to 3 (conflicts with class constraint)
      check = c.randomize() with {value == 3;};
      // Check if randomization was successful or failed due to constraint conflict 
      if(check)
        $display("\t Randomization Done @ Iteration:%0d value:%0d",i,c.value);
      else
        $display("\t Randomization Failed @ Iteration:%0d value:%0d",i,c.value);
    end
  end
endmodule

// OUTPUT
Randomization Failed @ Iteration:1 value:0
Randomization Failed @ Iteration:2 value:0
// Here the constraint solver takes both the constraints into consideration which means there was a conflict between these constraints,
// in these times randomization will not happen and returns the value 0. so based on the check display message is printed.
