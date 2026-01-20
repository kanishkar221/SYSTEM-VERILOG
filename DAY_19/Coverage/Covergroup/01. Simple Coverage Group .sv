module cover_grp;
  // Declare two 2-bit variables for coverage
  bit [1:0] a;
  bit [1:0] b;

  // Define covergroup to track coverage on a and b
  covergroup cgrp;
    c1: coverpoint a; // Coverpoint for a
    c2: coverpoint b; // Coverpoint for b
  endgroup

  // Declare an instance of the covergroup
  cgrp cg;

  initial begin
    cg = new(); // Instantiate covergroup

    // Repeat the sampling process 5 times
    repeat (5) begin
      a = $random() % 4; // Generate 2-bit random value for a (0-3)
      b = $random() % 4; // Generate 2-bit random value for b (0-3)
      
      cg.sample(); // Sample coverage
      
      // Display the values and current instance coverage percentage
      $display("a=%d ; b=%d ; coverage%% = %.2f", a, b, cg.get_inst_coverage());
    end
    
    // Display the overall functional coverage percentage
    $display("Overall functional coverage = %.2f%%", cg.get_coverage());
  end
endmodule

// OUTPUT
a=0 ; b=1 ; coverage% = 25.00
a=1 ; b=3 ; coverage% = 50.00
a=1 ; b=1 ; coverage% = 50.00
a=1 ; b=2 ; coverage% = 62.50
a=1 ; b=1 ; coverage% = 62.50
Overall functional coverage = 62.50%
