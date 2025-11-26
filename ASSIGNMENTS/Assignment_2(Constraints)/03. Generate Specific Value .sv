//Write a constraint to generate specific values: 25, 27, 30, 36, 40, 45.

class packet;
  rand int value;
  constraint specific_values {
    value inside {25, 27, 30, 36, 40, 45};
  }
endclass

module tb;
  packet pkt = new();
  initial begin
    repeat (10) begin
      if (pkt.randomize())
        $display("Generated value = %0d", pkt.value);
      else
        $display("Not Generated value");
    end
  end
endmodule

