class address_range;
  bit[31:0] start_address;
  bit[31:0] end_address;
  function new();
    start_address = 10;
    end_address = 50;
  endfunction
  // copy method 
  function address_range copy;
    copy = new();
    copy.start_address = this.start_address;
    copy.end_address = this.end_address;
    return copy;
  endfunction
endclass

class packet;
  bit [31:0] addr;          // class properties
  bit [31:0] data;
  address_range ar;         // class handle
  
  function new();           // constructor
    addr = 32'h10;
    data = 32'hFF;
    ar = new();             // object creating
  endfunction
  
  function void display();  // display class properties
    $display("addr = %0h",addr);
    $display("data = %0h",data);
    $display("start_address = %0d",ar.start_address);
    $display("end_address = %0d",ar.end_address);
  endfunction
  // copy method
  function packet copy();
    copy = new();
    copy.addr = this.addr;
    copy.data = this.data;
    copy.ar = ar.copy;    // calling copy function of tr
    return copy;
  endfunction
endclass  

module class_assignment;
  packet p1;
  packet p2;
  
  initial begin
    p1 = new ();              // creating p1 object
    $display("Calling p1 display");
    p1.display();
    
    p2 = new ();             // creating p2 object
    $display("Calling p2 display",);
    p2.display();
    
    p2 = p1.copy();          // calling copy method
    
    // change values with p2 handle
    p2.addr = 32'h68;
    p2.ar.start_address = 60;
    p2.ar.end_address = 80;
    
    $display("Calling p1 display after changing p2 properties");      
    p1.display();
    
    $display("Calling p2 display after changing p2 properties");
    p2.display();
  end
endmodule

// OUTPUT

Calling p1 display
addr = 10
data = ff
start_address = 10
end_address = 50
Calling p2 display 
addr = 10
data = ff
start_address = 10
end_address = 50
Calling p1 display after changing p2 properties
addr = 10
data = ff
start_address = 10
end_address = 50
Calling p2 display after changing p2 properties
addr = 68
data = ff
start_address = 60
end_address = 80
