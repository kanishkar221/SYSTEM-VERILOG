class packet;
  bit [31:0] addr;
  bit [31:0] data;
  // task declaration - extern indicates out of body declaration
  extern virtual task display();
endclass
// task implement outside class body    
task packet::display();
  $display("Addr = %0d,Data = %0d",addr,data);
endtask
 
module example;
  initial begin
    packet p;
    p = new();
    p.addr = 10;
    p.data = 20;
    p.display();
  end
endmodule

// OUTPUT
Addr = 10,Data = 20
