class rand_variable;
  rand logic[2:0] a;
endclass

rand_variable raf;

module rand_var;
  initial begin
    raf = new();    // rand_variable ra_f
    $display("rand - Randomizing the value of the variable in non cycling form ");
    for(int i=0;i<10;i++)begin
      void'(raf.randomize());
      $display("Iteration = %0d Random value of a = %0d",i, raf.a);
    end
    $display("--------------------------------------------------");
  end
endmodule

// OUTPUT
rand - Randomizing the value of the variable in non cycling form 
Iteration = 0 Random value of a = 4
Iteration = 1 Random value of a = 2
Iteration = 2 Random value of a = 6
Iteration = 3 Random value of a = 3
Iteration = 4 Random value of a = 0
Iteration = 5 Random value of a = 5
Iteration = 6 Random value of a = 3
Iteration = 7 Random value of a = 3
Iteration = 8 Random value of a = 3
Iteration = 9 Random value of a = 0
-------------------------------------
