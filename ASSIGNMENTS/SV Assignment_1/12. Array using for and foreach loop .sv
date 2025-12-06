12. Write the SystemVerilog code to:
    a) Declare a 2-state array, my_array, that holds four 12-bit values
    b) initialize my_array so that:
        i. my_array[0] = 12’h012
        ii. my_array[1] = 12’h345,
        iii. my_array[2] = 12’h678,
        iv. my_array[3] = 12’h9AB;
    c) Traverse my_array and print out bits [5:4] of each 12-bit element
        i. Using a for loop
        ii. Using a foreach loop

// CODE
module array_bits;
  bit [11:0] my_array [4];// a) Declare a 2-state array holding four 12-bit values
  integer i;
  initial begin
    // b) Initialize my_array
    my_array[0] = 12'h012;
    my_array[1] = 12'h345;
    my_array[2] = 12'h678;
    my_array[3] = 12'h9AB;

    // c-i) Print bits [5:4] using a for loop
    $display("Using for loop:");
    for (i = 0; i < 4; i++) begin
      $display("my_array[%0d][5:4] = %b", i, my_array[i][5:4]);
    end

    // c-ii) Print bits [5:4] using a foreach loop
    $display("Using foreach loop:");
    foreach (my_array[j]) begin
      $display("my_array[%0d][5:4] = %b", j, my_array[j][5:4]);
    end
  end
endmodule  

// OUTPUT
Using for loop:
my_array[0][5:4] = 01
my_array[1][5:4] = 00
my_array[2][5:4] = 11
my_array[3][5:4] = 10
Using foreach loop:
my_array[0][5:4] = 01
my_array[1][5:4] = 00
my_array[2][5:4] = 11
my_array[3][5:4] = 10
