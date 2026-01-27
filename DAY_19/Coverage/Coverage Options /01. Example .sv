// Coverage Options
class sample;
  rand bit [2:0] a;             // 3 bit random variable 'a'
  rand bit [3:0] b;             // 4 bit random variable 'b'
endclass

// Instance of class
sample s;
  
// Covergroup to track coverage of variables
covergroup cov_grp;
  c1 : coverpoint s.a {
    bins b1 = {1};              // Bin for value 1 of 'a'
    bins b2 = {3};              // Bin for value 3 of 'a'
    option.at_least = 2;        // Requires each bin to be hit at least twice
  }
  
  c2 : coverpoint s.a {
    option.weight = 2;          // Increase the probability of selecting 'a' in coverage
  }
  
  c3 : coverpoint s.b {
    option.auto_bin_max = 2;    // Automatically creates at most 2 bins for 'b'
  }
endgroup

cov_grp c;                      // Instance of covergroup

module tb_option_cg;
  initial begin
    s = new;                    // Instance of class sample
    c = new();                  // Instance of covergroup
    
    repeat (5) begin
      void'(s.randomize());
      c.sample();
      
      // Display variable values and coverage percentages
      $display("a = %d ; b = %d ; coverage %% = %.2f", s.a, s.b, c.get_inst_coverage());
      $display("Coverpoint c1 coverage%% = %.2f%%", c.c1.get_coverage());
      $display("Coverpoint c2 coverage%% = %.2f%%", c.c2.get_coverage());
      $display("Coverpoint c3 coverage%% = %.2f%%", c.c3.get_coverage());
      $display("-------------------------------------");
    end
  end
endmodule

// OUTPUT
a = 2 ; b =  8 ; coverage % = 18.75
Coverpoint c1 coverage% = 0.00%
Coverpoint c2 coverage% = 12.50%
Coverpoint c3 coverage% = 50.00%
-------------------------------------
a = 3 ; b =  4 ; coverage % = 37.50
Coverpoint c1 coverage% = 0.00%
Coverpoint c2 coverage% = 25.00%
Coverpoint c3 coverage% = 100.00%
-------------------------------------
a = 7 ; b =  6 ; coverage % = 43.75
Coverpoint c1 coverage% = 0.00%
Coverpoint c2 coverage% = 37.50%
Coverpoint c3 coverage% = 100.00%
-------------------------------------
a = 1 ; b =  3 ; coverage % = 50.00
Coverpoint c1 coverage% = 0.00%
Coverpoint c2 coverage% = 50.00%
Coverpoint c3 coverage% = 100.00%
-------------------------------------
a = 7 ; b =  2 ; coverage % = 50.00
Coverpoint c1 coverage% = 0.00%
Coverpoint c2 coverage% = 50.00%
Coverpoint c3 coverage% = 100.00%
-------------------------------------
