// Multidimensional static array using the constraint
class multi_dimensional_static_array;
  // Declare a 2D random array 'a' with dimensions [3][4] (3 rows, 4 columns), each element is 5-bit
  rand bit [4:0] a[2:0][3:0]; 
  // Constraint : sum ofeach row is 12
  constraint b {
    foreach (a[i])
      a[i].sum() with (int'(item)) == 12; // using sum() function with casting 
  }
endclass

module mod;
  int b;
  multi_dimensional_static_array pack;
  initial begin
    $display("Randomization of multidimensional array");
    pack = new();  // Create an instance of class
    $display("Before Randomization");
    $display("Array = %0p",pack.a);
    for (int i=1;i<=5;i++) begin
      void'(pack.randomize());
      $display("After Randomization");
      $display("Iteration = %0d,Array = %0p",i,pack.a);
    end
  end
endmodule            

// OUTPUT
Randomization of multidimensional array
Before Randomization
Array = '{'{'h0, 'h0, 'h0, 'h0}, '{'h0, 'h0, 'h0, 'h0}, '{'h0, 'h0, 'h0, 'h0}}
After Randomization
Iteration = 1,Array = '{'{'h3, 'h1, 'h4, 'h4}, '{'h0, 'h7, 'h1, 'h4}, '{'h9, 'h1, 'h2, 'h0}}
After Randomization
Iteration = 2,Array = '{'{'h0, 'h0, 'h1, 'hb}, '{'h0, 'h0, 'h3, 'h9}, '{'h3, 'h6, 'h2, 'h1}}
After Randomization
Iteration = 3,Array = '{'{'hb, 'h1, 'h0, 'h0}, '{'hc, 'h0, 'h0, 'h0}, '{'h5, 'h2, 'h3, 'h2}}
After Randomization
Iteration = 4,Array = '{'{'h0, 'h0, 'ha, 'h2}, '{'h1, 'h5, 'h4, 'h2}, '{'h0, 'h0, 'h8, 'h4}}
After Randomization
Iteration = 5,Array = '{'{'h5, 'h3, 'h3, 'h1}, '{'h9, 'h0, 'h3, 'h0}, '{'h0, 'h1, 'h3, 'h8}}
