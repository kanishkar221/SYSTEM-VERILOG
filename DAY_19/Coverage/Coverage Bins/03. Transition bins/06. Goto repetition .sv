// 06. Goto repetition
module goto_repet;
  // Declare 4 bit variable 'a'
  bit [3:0] a;
  // Declare dynamic array with predefined values
  bit [2:0] values[$] = '{1,2,3,4,3,4,2,3,4,5};
  
  // Define covergroup to track specific transition sequences
  covergroup cov_grp;
    c1 : coverpoint a {
      bins tran_1 = (1 => 4 [->3] => 5); // Matches transition from 1 to 4 occuring exactly 3 times before reaching 5
      // bins tran_2 = (1 => 3 [=3] => 4);  // Non - consecutive repetition(Another commented transition bin)
    }
  endgroup
  
  cov_grp cg = new();   // Instance of covergroup
  
  initial begin
    // Iterate over each value in the array and sample coverage
    foreach (values[i])
      begin
        a = values[i];   // Assign value from array  
        cg.sample();     // Sample coverage
        
        // Display current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
val =  1, cov = 0.00 %
val =  2, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 0.00 %
val =  2, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 0.00 %
val =  5, cov = 100.00 %
// NON - CONSECUTIVE 
val =  1, cov = 0.00 %
val =  2, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 0.00 %
val =  2, cov = 0.00 %
val =  3, cov = 0.00 %
val =  4, cov = 100.00 %
val =  5, cov = 100.00 %
