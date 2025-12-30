// Two-dimensional static array without using constraint.
class two_dimensional_static_array;
  rand bit [3:0] a[2][4];  // Declare a 2D random array 'a' with dimensions [2][4](2 rows,4 columns),each element is 4-bit
endclass

module mod;
  two_dimensional_static_array pack;
  initial begin
    pack = new;
    for (int i=0;i<=5;i++) begin
      void'(pack.randomize());   // Randomize the 2D
      $display("Value of elements of array after randomization = %0p",pack.a);
    end
  end
endmodule

// OUTPUT
Value of elements of array after randomization = {10 3 11 6} {4 3 11 1}
Value of elements of array after randomization = {4 9 14 6} {3 13 7 10}
Value of elements of array after randomization = {6 2 8 7} {0 7 3 11}
Value of elements of array after randomization = {7 15 15 6} {10 3 15 5}
Value of elements of array after randomization = {1 6 15 9} {6 10 1 13}
Value of elements of array after randomization = {3 3 8 6} {13 9 4 11}
