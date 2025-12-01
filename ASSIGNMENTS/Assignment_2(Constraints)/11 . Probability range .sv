// 11.Write a constraint where a variable's range of 0-100 has 10% probability and 101-255 has 30% probability.

class packet;
  rand bit [7:0] data;

  constraint c1 {
    data dist {
      [0  :100] := 10,
      [101:255] := 30
    };
  }
endclass

module tb;
  initial begin
    packet pkt = new();
    repeat (5) begin
      pkt.randomize();
      $display("Generated data = %0d", pkt.data);
    end
  end
endmodule
