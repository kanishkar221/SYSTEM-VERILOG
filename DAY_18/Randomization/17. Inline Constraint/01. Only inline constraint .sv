// Only inline constraint
class generator;
  rand bit [2:0] value;  // 3 bit random variable
endclass

module only_inline();
  generator c = new();
  initial begin
    //  Loop to perform randomization twice
    for(int i=1;i<=2;i++) begin
      // Apply an inline constraint to force value to 3
      void'(c.randomize()with{value == 3;});
      #1 $display("\t[%0d] Iteration:%0d Value:%0d",$time,i,c.value);
    end
  end
endmodule

// OUTPUT
[1] Iteration:1 Value:3
[2] Iteration:2 Value:3
