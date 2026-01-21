// 03. Covergroup defined outside class and module
class cover_group;
  rand bit [2:0] a;          // 3-bit random variable
  rand bit [1:0] b;          // 2-bit random variable
endclass

// Create an instance of the class
cover_group c = new();

// Define a covergroup that tracks coverage for a and b
covergroup cgrp;
  c1: coverpoint c.a;        // Coverpoint for variable a
  c2: coverpoint c.b;        // Coverpoint for variable b
endgroup

module outside;
  cgrp cg = new();           // Instantiate the covergroup

  initial begin
    repeat (5) begin
      void'(c.randomize());  // Randomize values of a and b
      cg.sample();           // Sample coverage with the new values

      // Display values and current instance coverage percentage
      $display("a = %d b = %d; coverage %% = %0.2f", c.a, c.b, cg.get_inst_coverage());
    end

    // Display overall coverage percentage
    $display("%f", cg.get_coverage());
  end
endmodule

// OUTPUT
a = 1 b = 1; coverage % = 18.75
a = 2 b = 0; coverage % = 37.50
a = 4 b = 1; coverage % = 43.75
a = 0 b = 2; coverage % = 62.50
a = 0 b = 3; coverage % = 75.00
75.000000
