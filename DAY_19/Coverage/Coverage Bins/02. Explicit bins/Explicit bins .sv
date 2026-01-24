// 02. Explicit bins
module explicit_bin;
  bit [2:0] a;          // Declare 3 bit variable 'a' for coverage sampling
  
  // Covergroup to track specific values of 'a'
  covergroup cv_grp;
    c1 : coverpoint a {
      bins b1 = {2};    // Explicit bin for value 2
      bins b2 = {3};    // Explicit bin for value 3
    }
  endgroup
  
  cv_grp cg = new();    // Instance of covergroup
  
  initial begin
    // Loop to generate random values for 'a' and sample coverage
    for (int i=1; i<=5; i++)
      begin
        a = $random();  // Assign random value to 'a'
        cg.sample();    // Sample coverage for 'a'
        
        // Display current value 'a' and coverage percentage
        $display("a=%d, Coverage=%.2f %%", a, cg.get_inst_coverage());
      end
  end
endmodule   

// OUTPUT
a=4, Coverage=0.00 %
a=1, Coverage=0.00 %
a=1, Coverage=0.00 %
a=3, Coverage=50.00 %
a=5, Coverage=50.00 %
