module std_random_module;
  bit [3:0] a;   // 4-bit variable (0 to 15)
  bit [3:0] b;
  bit [3:0] c;
  bit [3:0] d;
  bit [3:0] e;
  initial begin
    repeat(2)begin
      // Randomize variable 'a' without any constraint
      // void is used to ignore the return value of std::randomize
      void'(std::randomize(a));
      $display("Value of a:%d",a);
      // Randomize variable 'b' with constraint , b>6
      // void' is used to ignore the return value of std::randomize
      void'(std::randomize(b) with {b>6;a<12;});
      $display("Value of b:%d",b);
      // Randomize variable 'c' and 'd' together
      // Constraints : c<4 - 0 to 3 ,d<3 - 0 to 2
      void'(std::randomize(c,d)with {c<4;d<3;});
      $display("Value od c:%d and d:%d",c,d);
      // Random Variable 'e' using inside constraint, value is between 1 and 4 
      void'(std::randomize(e)with {e inside {[1:4]};});
      $display("Value of e:%d",e);
      $display("--------------------------");     
    end
  end
endmodule

// OUTPUT
Value of a: 4
Value of b:12
Value od c: 2 and d: 0
Value of e: 3
--------------------------
Value of a: 6
Value of b:15
Value od c: 1 and d: 2
Value of e: 3
--------------------------
