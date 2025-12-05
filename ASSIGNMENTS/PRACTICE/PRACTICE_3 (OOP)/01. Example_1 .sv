// class and create a instance in SV
class packet;
  rand bit [7:0] data;
  rand bit [7:0] addr;
  
  function void display();
    $display("Data = %0d,Addr = %0d",data,addr);
  endfunction
endclass

module example;
  packet pkt = new(); // create an instance of packet
  initial begin
    pkt.randomize();
    pkt.display();
  end
endmodule

// OUTPUT
Data = 55,Addr = 73
