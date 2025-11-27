// Write a constraint for a 16-bit variable such that no two consecutive 1's are generated.

class packet;
  rand bit [15:0] data;

  // Constraint: no consecutive 1's
  constraint no_consecutive {
    foreach (data[i])
      if (i < 15)
        !(data[i] && data[i+1]);   // adjacent 1's not allowed
  }
endclass


module tb;
  packet pkt = new();
  initial begin
    repeat (10) begin
      pkt.randomize();
      $display("Generated data = %016b", pkt.data);
    end
  end
endmodule
