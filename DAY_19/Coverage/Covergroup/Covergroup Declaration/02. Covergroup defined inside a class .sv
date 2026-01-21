// 02.Covergroup defined inside a class
class pack;
  rand bit [1:0] a;
  rand bit [1:0] b;
  
  // Define a covergroup to track coverage for a and b
  covergroup cg;
    c1: coverpoint a;  // coverpoint for a
    c2: coverpoint b;  // coverpoint for b
  endgroup
  
  // Constructor to instantiate the covergroup
  function new();
    cg = new();
  endfunction
endclass

// Create an instance of pack before the module starts execution
pack p = new();

module  covergroup_inside_class;
  initial begin
    repeat(5) begin
      void'(p.randomize()); // Randomize a and b
      p.cg.sample(); // Sample the covergroup with new values
      // Display current values and coverage percentage
      $display("a=%d ; b=%d ; coverage %% = %.2f", p.a, p.b, p.cg.get_inst_coverage());
    end
  end
endmodule

// OUTPUT
a=1 ; b=1 ; coverage % = 25.00
a=2 ; b=0 ; coverage % = 50.00
a=0 ; b=1 ; coverage % = 62.50
a=0 ; b=2 ; coverage % = 75.00
a=0 ; b=3 ; coverage % = 87.50
