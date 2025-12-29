class class_a;
  rand byte a;
  rand byte x;
  constraint cons_name {a<6;a>2;}
  extern constraint cons_name2;
endclass

constraint class_a::cons_name2{x>7;}
module mod;
  class_a pack;
  initial begin
    pack = new;
    for (int i=0;i<=5;i++)begin
      void'(pack.randomize());
      $display("Iteration = %0d Value of a = %0d Value of x = %0d",i,pack.a,pack.x);
      $display("------------------------------------------");
    end
  end
endmodule

// OUTPUT
Iteration = 0 Value of a = 3 Value of x = 98
------------------------------------------
Iteration = 1 Value of a = 3 Value of x = 8
------------------------------------------
Iteration = 2 Value of a = 3 Value of x = 51
------------------------------------------
Iteration = 3 Value of a = 4 Value of x = 27
------------------------------------------
Iteration = 4 Value of a = 3 Value of x = 124
------------------------------------------
Iteration = 5 Value of a = 3 Value of x = 11
------------------------------------------
