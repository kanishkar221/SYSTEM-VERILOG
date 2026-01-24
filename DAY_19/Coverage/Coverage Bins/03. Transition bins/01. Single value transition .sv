// 01. Single value transition
module single_val_trans_bin;
  bit [3:0] a;                       // Declare 4 bit variable a
  bit [2:0] values[$] = '{1,2,3,4};  // Declare dynamic array to store predefined values

  // Covergroup with transition bins
  covergroup cov_grp;
    c1 : coverpoint a {
      bins tran_1 = (1 => 2); // Track transition from 1 to 2
      bins tran_2 = (3 => 4); // Track transition from 3 to 4
    }
  endgroup

  // Create an instance of covergroup
  cov_grp cg = new();

  initial begin
    // Iterate over each value in the array and sample coverage
    foreach(values[i])
      begin
        a = values[i]; // Assign value from the array
        cg.sample();   // Sample coverage
        
        // Display the current value and coverage percentage
        $display("val = %d, cov = %.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule    

// OUTPUT
val =  1, cov = 0.00 %
val =  2, cov = 50.00 %
val =  3, cov = 50.00 %
val =  4, cov = 100.00 %
