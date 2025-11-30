// 12. Write a constraint to generate values in increasing order.

class packet;
  rand bit [3:0] val[15];
  constraint c{
    foreach (val[i])
      if(i<14)
        val[i]<val[i+1];
  }
endclass

module tb;
  packet pkt = new();
  
  initial begin
    pkt.randomize();
    foreach (pkt.val[i])
      $display("Generate values in increasing order = %d",pkt.val[i]);
  end
endmodule
