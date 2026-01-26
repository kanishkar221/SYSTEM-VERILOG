// 4. Consecutive Repetitions
module cons_repet;
  // Declare 4 bit variable 'a'
  bit [3:0] a;
  // Declare dynamic array with predefined values
  bit [2:0] values[$] = '{2,2,4,4,4};
  
  // Define covergroup to track consecutive occurences of values
  covergroup cov_grp;
    c1 : coverpoint a {
      bins tran_1 = (2[*2]);  // Match two consecutive occurences of 2
      bins tarn_2 = (4[*3]);  // Match three consecutive occurences of 4
    }
  endgroup
  
  cov_grp cg = new();   // Instance of covergroup
  
  initial begin
    // Iterate over each value in array and sample coverage
    foreach (values[i])
      begin
        a = values[i];   // Assign value from array
        cg.sample();     // Sample Coverage
             
        // Display current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
val =  2, cov = 0.00 %
val =  2, cov = 50.00 %
val =  4, cov = 50.00 %
val =  4, cov = 50.00 %
val =  4, cov = 100.00 %
