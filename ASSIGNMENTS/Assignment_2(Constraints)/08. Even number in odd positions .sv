// 8. Write a constraint to generate a sequence where even numbers appear in odd positions.

class packet;
  rand bit[3:0]seq[10];
  
  constraint position {
    foreach (seq[i]) {
      if (i % 2 == 1)        // Odd position (1,3,5,7,...)
        seq[i] % 2 == 0;     // Value must be in even
      else                   // Even position (2,4,6,8,...)
        seq[i] % 2 == 1;     // Value must be in odd
    }
  }
endclass
      
module tb;
  packet pkt = new();
  initial begin
    pkt.randomize();
    $display("Generated Sequence:");
    foreach (pkt.seq[i])
      $display("Position %0d = %0d",i,pkt.seq[i]);
  end
endmodule
