// 01. Use iff keyword to add a condition to the coverpoint.
module cvgrp_iff;
  bit [2:0] a;  // 3 bit variable to be covered
  bit [1:0] b;  // 2 bit control variable
  bit clk;      // clock signal
  
  // Generate a clk signal with a period of 10 time units
  always #5 clk = ~clk;
  
  // Define a covergroup that samples on the rising edge of clk
  covergroup cvgrp @ (posedge clk);
    // Coverpoint for 'a' that is sampled only when 'b' is equal to 2
    c1: coverpoint a iff (b == 2) {
      bins b1 = {4};  // Bin value 4
      bins b2 = {5};  // Bin value 5
    }
  endgroup
  
  cvgrp cg = new();   // Instantiate covergroup
  
  initial begin
    // Loop 8 times to generate random values and sample coverage
    for(int i=0; i<8; i++) begin
      a = $random; // Assign random value to a 
      b = $random; // Assign random value to b
      @ (posedge clk);  // Rising edge clk
      // Check if 'b' is 2, then execute the coverpoint sampling
      if (b == 2)
        $write("if 'b' is 2 then coverpoints are executed;\t");
      
      // Display the current values and coverage percentage
      $display("a=%0d ; b=%0d ; coverage %% = %.2f", a, b, cg.get_inst_coverage());
    end
  $finish;
  end
endmodule

// OUTPUT
a=4 ; b=1 ; coverage % = 0.00
a=1 ; b=3 ; coverage % = 0.00
a=5 ; b=1 ; coverage % = 0.00
if 'b' is 2 then coverpoints are executed;	a=5 ; b=2 ; coverage % = 50.00
a=1 ; b=1 ; coverage % = 50.00
a=6 ; b=1 ; coverage % = 50.00
a=5 ; b=0 ; coverage % = 50.00
if 'b' is 2 then coverpoints are executed;	a=1 ; b=2 ; coverage % = 50.00
