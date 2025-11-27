// 7.Write a constraint to avoid generating the same 4-variable value as any of the last 5 occurrences.

class packet;
  rand bit [3:0] data;
  bit [3:0] last_value[5]; //Store last 5 values
  
  // Constraint: avoid matching any of last 5 values
  constraint no_repeat_last5{
    foreach(last_value[i])
    {
      data != last_value[i];
    }
  }
endclass
  
  
module tb;
  packet pkt = new() ;
  initial begin
    repeat(10)begin
      pkt.randomize();
      $display("Generated data =%d",pkt.data);
      
      for(int i=4;i>0;i--)           //move older values
        pkt.last_value[i] = pkt.last_value [i-1];
      
      pkt.last_value[0] = pkt.data;  //store new value at position 0
    end
  end
endmodule

