class randc_variable;
  randc bit[2:0] a;
endclass

module randc_var;
  randc_variable randc_handle = new();
  initial begin
    $display("randc - It is cyclic in nature, It will repeat");
    $display("It's value after completing one cycle");
    for(int i=0;i<12;i++)begin
      void'(randc_handle.randomize());
      $display("Iteration=%0d Random Value=%0d",i,randc_handle.a);
    end
  end
endmodule

//OUTPUT
randc - It is cyclic in nature, It will repeat
It's value after completing one cycle
Iteration=0 Random Value=2
Iteration=1 Random Value=3
Iteration=2 Random Value=7
Iteration=3 Random Value=0
Iteration=4 Random Value=4
Iteration=5 Random Value=5
Iteration=6 Random Value=1
Iteration=7 Random Value=6
Iteration=8 Random Value=5
Iteration=9 Random Value=3
Iteration=10 Random Value=0
Iteration=11 Random Value=1
