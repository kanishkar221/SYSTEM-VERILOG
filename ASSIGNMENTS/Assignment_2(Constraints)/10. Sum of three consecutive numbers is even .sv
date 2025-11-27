// 10.Write a constraint to ensure that the sum of three consecutive numbers is even.

class packet;
  rand bit[3:0] seq[3];
  // Constraint Sum must be EVEN
  constraint sum_even_c {
    (seq[0] + seq[1] + seq[2]) % 2 == 0;
  }
endclass

module tb;
  initial begin
    packet pkt = new();
    int sum; 
    repeat (5) begin
      pkt.randomize();
      sum = pkt.seq[0] + pkt.seq[1] + pkt.seq[2];
      
      $display("Numbers = %0d, %0d, %0d  Sum = %0d", pkt.seq[0], pkt.seq[1], pkt.seq[2], sum);
    end
  end
endmodule
  
