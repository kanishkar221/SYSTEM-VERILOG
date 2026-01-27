// 04. Wildcard bins
module wildcard_bins;
  // Declare 4 bit variable 'a'
  bit [3:0] a;
  // Declare Dynamic array with predefined values
  bit [3:0] values[$] = '{4'b1000, 4'b1001, 4'b1010, 4'b1011};
  
  // Define covergroup to track wildcard based value matching
  covergroup cov_grp;
    c1 : coverpoint a {
      wildcard bins b1 = {4'b100x};  // Matches any value where the first three bits are '100' (0 or 1)
      wildcard bins b2 = {4'b101x};  // Matches any value where the first three bits are '101' (0 or 1)
    }
  endgroup
  
  cov_grp cg = new();                // Instance of covergroup
  
  initial begin
    // Iterate over each value in the array and sample coverage
    foreach(values[i])
      begin
        a = values[i];               // Assign values from array
        cg.sample();                 // Sample coverage 
        
        // Display current values and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule  

// OUTPUT
val =  8, cov = 50.00 %
val =  9, cov = 50.00 %
val = 10, cov = 100.00 %
val = 11, cov = 100.00 %
