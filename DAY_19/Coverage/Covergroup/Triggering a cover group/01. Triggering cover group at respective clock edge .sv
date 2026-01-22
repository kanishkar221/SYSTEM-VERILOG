// 01. Triggering cover group at respective clock edge
module cvgrp_using_clk;
  bit [2:0] a;     // 3 bit variable to be covered
  bit b;           // 1 bit variable to becovered
  bit clk;         // Clk signal
  
  // Generate the clk signal with a period of 10 time units
  always #5 clk = ~clk;
  
  // Define a covergroup that samples on the rising edge of clk
  covergroup cvgp @ (posedge clk);
    c1: coverpoint a;
    c2: coverpoint b;
  endgroup
  
  cvgp cg = new;  // Instantiate the covergroup
  
  initial begin
    repeat (5) begin
      @ (posedge clk);
      a = $random;
      b = $urandom;
      // Display the current values and coverage percentage
      $display("a=%d ; b=%d ; coverage %%=%.2f",a,b,cg.get_inst_coverage());
    end
    $finish;
  end
endmodule

// OUTPUT
a=4 ; b=1 ; coverage %=31.25
a=1 ; b=1 ; coverage %=62.50
a=1 ; b=0 ; coverage %=68.75
a=3 ; b=1 ; coverage %=68.75
a=5 ; b=0 ; coverage %=75.00
