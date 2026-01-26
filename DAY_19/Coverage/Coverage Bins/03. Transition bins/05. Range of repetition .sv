// 05. Range of repetition
module range_of_repet;
  // Declare 4 bit variable 'a'
  bit [3:0] a;
  // Declare dynamic array with predefined values
  bit [2:0] values[$] = '{2,3,2,2,2,2,4,4};
  
  // Covergroup to track repeated occurences of values
  covergroup cov_grp;
    c1 : coverpoint a {
      bins tran_1 = (2[*3:5]);  // Matches 2 appearing between 3 to 5 consecutive times
      bins tran_2 = (4[*3]);    // Matches exactly 3 consecutive occurences of 4
    }
  endgroup
  
  cov_grp cg = new();           // Instance of covergroup
  
  initial begin
    // Iterate over each value in array and sample coverage
    foreach(values[i])
      begin
        a = values[i];          // Assign values from array
        cg.sample();            // Sample coverage
        
        // Display current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
val =  2, cov = 0.00 %
val =  3, cov = 0.00 %
val =  2, cov = 0.00 %
val =  2, cov = 0.00 %
val =  2, cov = 50.00 %
val =  2, cov = 50.00 %
val =  4, cov = 50.00 %
val =  4, cov = 50.00 %
