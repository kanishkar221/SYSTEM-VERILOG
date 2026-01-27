// 05. Ignore bins
module ignore_bin;
  // Declare 2 bit variable 'a'
  bit [1:0] a;
  // Declare dynamic array with predefined values
  bit [1:0] values[$] = '{0,1,2,3};
  
  // Define covergroup with ignored bins
  covergroup cov_grp;
    c1 : coverpoint a {
      ignore_bins b1 = {1,2};  // Ignore values 1 and 2 from coverage
    }
  endgroup
  
  cov_grp cg = new();          // Instance of covergroup
  
  initial begin
    // Iterate over each value in the array and sample coverage 
    foreach(values[i])
      begin
        a = values[i];         // Assign value from array
        cg.sample();           // Sample coverage
        
        // Display the current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule    

// OUTPUT
val = 0, cov = 50.00 %
val = 1, cov = 50.00 %
val = 2, cov = 50.00 %
val = 3, cov = 100.00 %
