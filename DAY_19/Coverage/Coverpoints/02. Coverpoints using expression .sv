// 02. Coverpoints using expression
module expression; 
  bit [1:0] a;              // 2 bit variable a
  bit [2:0] b;              // 3 bit variable b

  // Define a covergroup to track coverage for a,b and their product
  covergroup cg;
    a1: coverpoint a;       // Coverpoint for a
    b1: coverpoint b;       // Coverpoint for b
    axb: coverpoint a * b;  // Coverpoint for the product of a and b
  endgroup: cg

  cg cg_inst;               // Declare an instance of covergroup

  initial begin
    cg_inst = new();        // Instantiate the covergroup

    // Repeat 10 times to generate random values and sample coverage
    repeat (10) begin
      a = $random;          // Assign random value to a
      b = $random;          // Assign random value to b
      cg_inst.sample();     // Sample the covergroup with new values

      // Display current values and coverage percentage
      $display("a=%d b=%d axb=%d coverage %%=%0.2f", a, b, a * b, cg_inst.get_inst_coverage());
    end
  end
endmodule

// OUTPUT
a=0 b=1 axb=0 coverage %=16.67
a=1 b=3 axb=3 coverage %=33.33
a=1 b=5 axb=5 coverage %=41.67
a=1 b=2 axb=2 coverage %=50.00
a=1 b=5 axb=5 coverage %=50.00
a=2 b=5 axb=2 coverage %=58.33
a=1 b=4 axb=4 coverage %=66.67
a=1 b=6 axb=6 coverage %=75.00
a=1 b=2 axb=2 coverage %=75.00
a=1 b=7 axb=7 coverage %=83.33
