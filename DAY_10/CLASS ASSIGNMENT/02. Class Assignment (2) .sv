// CODE

class packet;
  bit [31:0] addr;      // class properties
  bit [31:0] data;
  bit write;
  string pkt_type;
  
  function new();       // constructor
    addr = 32'h10;
    data = 32'hFF;
    write = 1;
    pkt_type = "GOOD";
  endfunction
  
  function void display();
    $display("addr = %0d",addr);
    $display("data = %0h",data);
    $display("write = %0d",write);
    $display("pkt_type = %0s",pkt_type);
  endfunction
endclass  

// TOP MODULE

module class_assignment;
  packet p1;
  packet p2;
  
  initial begin
    p1 = new();
    $display("Calling p1 display");
    p1.display();
    p2 = p1;   // assign p1 to p2
    $display("Calling p2 display",);
    p2.display();
    // change values with p2 handle
    p2.addr = 32'hAB;
    p2.pkt_type = "BAD";
    //changes made with p2 handle will reflect on p1
    $display("Calling p1 display");
    p1.display();
  end
endmodule

// OUTPUT

Calling p1 display
addr = 16
data = ff
write = 1
pkt_type = GOOD
Calling p2 display 
addr = 16
data = ff
write = 1
pkt_type = GOOD
Calling p1 display
addr = 171
data = ff
write = 1
pkt_type = BAD
