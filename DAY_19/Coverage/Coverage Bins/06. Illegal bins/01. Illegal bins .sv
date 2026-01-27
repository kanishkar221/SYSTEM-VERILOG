// 06. Illegal bins
module illegal_bin;
  // Declare 2 bit variable 'a'
  bit [1:0] a;
  // Declare dynamic array with predefined values
  bit [1:0] values[$] = '{0,1,2,3};
  
  // Define covergroup with illegal bin
  covergroup cov_grp;
    c1 : coverpoint a { 
      illegal_bins b1 = {2};  // Mark value 2 as illegal in coverage
    }
  endgroup
  
  cov_grp cg = new();         // Instance of covergroup
  
  initial begin
    // Iterate over each value in the array and sample coverage
    foreach(values[i])
      begin
        a = values[i];        // Assign values from array
        cg.sample();          // Sample coverage
        
        // Display current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
val = 0, cov = 33.33 %
val = 1, cov = 66.67 %
Error: ACDB_0012 testbench.sv (11): Illegal bin 'b1' was hit with value '2' at iteration #2 of covergroup sampling. It will have no impact on the coverage statistics. HDL instance: "/illegal_bin". Covergroup type: "cov_grp", covergroup instance: "<UNNAMED1>", coverpoint: "c1".
val = 2, cov = 66.67 %
val = 3, cov = 100.00 %
