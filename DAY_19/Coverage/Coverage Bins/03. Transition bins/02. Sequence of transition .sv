// 02. Sequence of transition
module single_val_trans_bin;
  // Declare 4 bit variable 'a'
  bit [3:0] a;
  // Declare Dynamic array with predefined values
  bit [2:0] values[$] = '{1,2,3,4};
  
  // Covrgroup to track specific transition sequences of 'a'
  covergroup cov_grp;
    c1 : coverpoint a {
      bins tran_1 = (1 => 2 => 3);  // Track transition from 1 to 2 to 3
      bins tran_2 = (1 => 2 => 4);  // Track transition from 1 to 2 to 4
    }
  endgroup
  
  cov_grp cg = new();   // Instance of covergroup
  
  initial begin
    // Iterate over each value in array and sample coverage 
    foreach(values[i])
      begin
        a = values[i];  // Assign value from array
        cg.sample();    // Sample coverage
        
        // Display current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
val =  1, cov = 0.00 %
val =  2, cov = 0.00 %
val =  3, cov = 50.00 %
val =  4, cov = 50.00 %
