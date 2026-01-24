// 01. Automatic or Implicit Bins
module implicit_bin;
  bit [2:0] a;          // Declare 3 bit variable 'a' for coverage sampling
  
  // Define covergroup to track coverage 'a'
  covergroup cov_grp;
    c1 : coverpoint a;  // Coverpoint for variable 'a'
  endgroup
  
  cov_grp cg = new();   // Instance of covergroup
  
  initial begin
    // Loop to generate random values for 'a' and sample coverage
    for(int i=1;i<=5;i++)
      begin
        a=$random();    // Assign random value to 'a'
        cg.sample();    // Sample coverage for 'a'
        // Display the current value of 'a' and coverage percentage
        $display("a=%d, coverage = %.2f %%",a, cg.get_inst_coverage());
      end
  end
endmodule

// OUTPUT
a=4, coverage = 12.50 %
a=1, coverage = 25.00 %
a=1, coverage = 25.00 %
a=3, coverage = 37.50 %
a=5, coverage = 50.00 %
