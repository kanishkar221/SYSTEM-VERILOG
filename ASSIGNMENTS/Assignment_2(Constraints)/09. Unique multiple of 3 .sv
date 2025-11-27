// 9.Write a constraint to generate unique multiples of 3.

class packet;
  rand bit[3:0] data;
  bit [3:0] values[$];        // Dynamic array to store values
  
  constraint unique_mul_3 {
    data % 3 == 0;            // Multiple of 3
    foreach (values[i])
      data != values[i];      // Values must not repeat
  }
endclass

module tb;
  packet pkt = new();
  initial begin
    repeat (6) begin
      if(pkt.randomize()) begin
        $display("Unique multiple of 3 = %0d",pkt.data);
        pkt.values.push_back(pkt.data);
      end
    end
  end
endmodule
      
