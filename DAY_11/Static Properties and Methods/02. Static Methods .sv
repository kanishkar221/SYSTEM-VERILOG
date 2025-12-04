// using static keyword
class packet;              
  static byte no_of_pkts_created; //static property to keep track number of pkts created
  
  function new();
    no_of_pkts_created ++;
  endfunction
  
  static function void display_packets_created();
    $display(" %0d packets created ",no_of_pkts_created);
  endfunction
endclass

module static_properties;
  packet pkt[3];
  initial begin
    foreach (pkt[i]) begin
      pkt[i] = new();
    end
    pkt[0].display_packets_created();
  end
endmodule

// OUTPUT
  3 packets created
