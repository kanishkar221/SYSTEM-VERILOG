// Static Array - One dimensional Array
class single_static_array;
  randc byte a[7];
endclass

module static_array;
  single_static_array stat_arr;
  initial begin
    stat_arr = new();
    $display("Static Array - Size is already declared. So we can only randomize");
    $display("Elements of it");
    
    $display("rand byte a[7];");
    
    $display("Before randomizing the elements of array 'a'");
    $display("Assign by default value of array data type");
    $display("%0p",stat_arr.a);
    
    void'(stat_arr.randomize());
    $display("After randomizing the elements of array 'a'");
    $display("Output = %0p", stat_arr.a);
  end
endmodule

// OUTPUT
Static Array - Size is already declared. So we can only randomize
Elements of it
rand byte a[7];
Before randomizing the elements of array 'a'
Assign by default value of array data type
0 0 0 0 0 0 0
After randomizing the elements of array 'a'
Output = 52 -103 -83 -56 -39 -60 75
