// 2. How can you generate Gray code sequences using SystemVerilog
class gray_code;
  // "rand" is used for constraints to control this variable
  rand bit [3:0] array[];
  // Constraint to generate 4 bit gray code
  constraint c {
    array.size() == 16;
    foreach (array[i]) {
      array[i] == (i^(i>>1));
    }
  }
endclass
      
module constraint_gray;
  gray_code code;
  initial begin
    code = new();
    if(!code.randomize())
      // $fatal - is used to immediately stop simulation when a critical error occurs that makes further simulation meaningless.
      $fatal("Randomization Failed");
    
    $display("4 bit gray code sequence");
    foreach(code.array[i])
      $display("Binary = %0d Gray = %4b", i,code.array[i]);
    $finish;
  end
endmodule

// OUTPUT
4 bit gray code sequence
Binary = 0 Gray = 0000
Binary = 1 Gray = 0001
Binary = 2 Gray = 0011
Binary = 3 Gray = 0010
Binary = 4 Gray = 0110
Binary = 5 Gray = 0111
Binary = 6 Gray = 0101
Binary = 7 Gray = 0100
Binary = 8 Gray = 1100
Binary = 9 Gray = 1101
Binary = 10 Gray = 1111
Binary = 11 Gray = 1110
Binary = 12 Gray = 1010
Binary = 13 Gray = 1011
Binary = 14 Gray = 1001
Binary = 15 Gray = 1000
