// post - randomize
class generator;
  rand bit [2:0] value;
  int check;
  constraint exp {value > 5;}
  
  function void pre_randomize();
    $display("pre_randomize function");
    check = 0;
  endfunction
  
  function void post_randomize();
    $display("post_randomize function");
    check = 1;
  endfunction
endclass

module post_randomization();
  generator gen = new();
  int check;
  
  initial begin
    $display("\t [%0t]Calling Randomize",$time);
    check = gen.randomize();
    #1 $display("\t[%0t] Iteration:1 Value:%0d",$time,gen.value);
    if(check == 1)
      $display("\t Randomizatiom is performed");
    else
      $display("\t Randomization is not performed");
    
    $display("\t[%0t] Calling Randomize",$time);
    check = gen.randomize() with {value < 5;};
    #1 $display("\t[%0t] Iteration:2 Value:%0d",$time,gen.value);
    if(check == 1)
      $display("\t Randomization is performed");
    else
      $display("\t Randomization is not performed");
    end
endmodule

// OUTPUT
[0]Calling Randomize
pre_randomize function
post_randomize function
[1] Iteration:1 Value:7
Randomizatiom is performed
[1] Calling Randomize
pre_randomize function
Warning: RC_0024 testbench.sv(32): Randomization failed. The condition of randomize call cannot be satisfied.
Info: RC_0103 testbench.sv(32): ... the following condition cannot be met: (5<gen.value)&&(gen.value<5)
Info: RC_1007 testbench.sv(2): ... see class 'generator' declaration.
[2] Iteration:2 Value:7
Randomization is not performed
