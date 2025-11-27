// 6.Write a constraint to generate a 32-bit number where exactly one bit is high.

class packet;
  randc bit [31:0] data;

  // Constraint: exactly one bit must be high
  constraint one_high_bit {
    $countones(data) == 1;
  }
endclass


module tb;
  packet pkt = new();
  
  initial begin
    repeat(10) begin
      pkt.randomize();
      $display("Generated one high bit data = %b", pkt.data);
    end
  end
endmodule
