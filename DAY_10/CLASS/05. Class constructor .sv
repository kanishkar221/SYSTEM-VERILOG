class packet;
  bit [31:0] addr;     // class properties
  bit [31:0] data;
  bit write;
  string pkt_type;
  
  function new();      // constructor
    this.addr = 32'h10;
    this.data = 32'hFF;
    this.write = 1;
    this.pkt_type = "GOOD";
  endfunction
  
  function void display();
    $display("addr = %0d",addr);
    $display("data = %0h",data);
    $display("write = %0d",write);
    $display("pkt_type = %0s",pkt_type);
  endfunction
endclass

module sv_constructor;
  packet pkt;
  initial begin
    pkt = new();
    pkt.display();
  end
endmodule

// OUTPUT

addr = 16
data = ff
write = 1
pkt_type = GOOD



