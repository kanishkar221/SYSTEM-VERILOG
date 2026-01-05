// pre - randomize
class generator;
  rand bit [4:0] value;   // 5 bit random variable
  // Integer variable used to track iterations
  int i;
  // Function executed before randomization
  function void pre_randomize();
    // If 'i' is even ,disable randomization
    if (i%2 == 0) begin
      rand_mode(0);  // Turns off randomization for 'value'
      $display("Stopping Randomization");
    end
    else begin
      rand_mode(1); // Enable randomization
      $display("Enable Randomization");
    end
    i++;            // Increment Counter
  endfunction
endclass

module pre_randomization();
  generator gen = new();
  initial begin
    // loop to perform  randomization 4 times
    for(int i=1;i<5;i++) begin
      $display("\t [%0t] Calling Randomize",$time);
      // Perform Randomization (pre_randomize() is augomatically called before this)
      void'(gen.randomize());
      // Display the randomized value (or unchanged value if randomization was disabled)
      #1 $display("\t [%0t] @ iteration:%0d value:%0d",$time,i,gen.value);
    end
  end
endmodule

// OUTPUT
[0] Calling Randomize
Stopping Randomization
[1] @ iteration:1 value:0
[1] Calling Randomize
Enable Randomization
[2] @ iteration:2 value:3
[2] Calling Randomize
Stopping Randomization
[3] @ iteration:3 value:3
[3] Calling Randomize
Enable Randomization
[4] @ iteration:4 value:30
