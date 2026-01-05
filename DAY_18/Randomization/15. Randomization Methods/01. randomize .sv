// randomize
class generator;
  rand bit [2:0]value;   // 3 bit random variable
  constraint cons {value == 5;}  //Constraint : value to always be 5 
endclass

module randomization();
  generator gen = new();
  initial begin 
    $display("\t Calling Randomize");
    
    // First randomization attempt (should always result in value = 5 due to the constraint)
    if (gen.randomize())
      $display("\t Value:%0d Randomization Successful",gen.value);
    else
      $display("\t Value:%0d Randomization Failed",gen.value);
    
    // Second randomization attempt using an inline constraint (overrides class constraint). Here, we are forcing value to be 2 instead of 5 
    $display("\t Calling Randomize");
    if (gen.randomize() with {value == 2;})
      $display("\t Value:%0d Randomization Successful",gen.value);
    else
      $display("\t Value:%0d Randomization Failed",gen.value);
  end
endmodule

// OUTPUT
Calling Randomize
Value:5 Randomization Successful
Calling Randomize
Warning: RC_0024 testbench.sv(20): Randomization failed. The condition of randomize call cannot be satisfied.
Info: RC_0109 testbench.sv(20): ... after reduction gen.value to 5
Info: RC_0103 testbench.sv(20): ... the following condition cannot be met: (3'(5)==2)
Info: RC_1007 testbench.sv(2): ... see class 'generator' declaration.
Value:5 Randomization Failed
