// class methods and constructor
class packet;
  rand bit [7:0] data = 5;
  rand bit [15:0] addr = 2;
  
  function void display();
    $display("Data = %0d,Addr = %0d",this.data,this.addr);
  endfunction
endclass

module example;
  packet pkt = new();  // create an instance of packet
  initial begin
    pkt.display();     // calls display method on this instance
  end
endmodule

// OUTPUT
Data = 5,Addr = 2
