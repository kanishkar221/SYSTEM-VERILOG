//Create a 61-bit variable constraint such that bits 0-31 are 1 and the remaining bits are 0.

class packet;
  rand bit [60:0] data;

  constraint c1 {
    data[31:0]  == 32'hFFFF_FFFF;  // bits 0–31 = 1
    data[60:32] == 29'd0;          // bits 32–60 = 0
  }
endclass


module tb;
  packet pkt = new();
  
  initial begin
    pkt.randomize();
    $display("Generated data = %061b", pkt.data);
  end
endmodule
