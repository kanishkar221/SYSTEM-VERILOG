// 01. Cross coverage is carried out between coverpoint c1 and c2
class pack;
  rand bit a;  // 1 bit random variable 'a'
  rand bit b;  // 1 bit random variable 'b'
  
  // Covergroup to track coverage of a and b
  covergroup cg;
    c1: coverpoint a;   // coverpoint for 'a'
    c2: coverpoint b;   // coverpoint for 'b'
    c3: cross c1, c2;   // cross coverage between 'a' and 'b'
  endgroup
  
  function new();
    cg = new();
  endfunction
  
endclass

module cvgrp_cross;
  initial begin
    pack p = new(); // create an instance of class 'pack'
    // repeat 5 times to generate random values and sample coverage
    repeat (5) begin
      void'(p.randomize());  // Randomize a and b
      p.cg.sample();         // Sample the covergroup with new values
      
      // Display the current values and coverage percentage
      $display("a=%0d ; b=%0d ; coverage %%=%.2f", p.a, p.b, p.cg.get_inst_coverage());
    end
    
    // To display overall coverage percentage
    //$display("%0.2f",p.cg.get_covergae());
  end
endmodule

// OUTPUT
a=1 ; b=1 ; coverage %=41.67
a=1 ; b=0 ; coverage %=66.67
a=1 ; b=0 ; coverage %=66.67
a=1 ; b=1 ; coverage %=66.67
a=1 ; b=0 ; coverage %=66.67
