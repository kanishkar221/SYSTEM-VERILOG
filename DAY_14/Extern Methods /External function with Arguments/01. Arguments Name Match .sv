// Arguments name match
class packet;
  // function declaration - extern indicate out of body declaration 
  extern virtual function void display(bit [31:0] addr,data);
endclass
    
// function implementation outside class body   
function void packet::display(bit[31:0]addr,data);
  $display("Addr = %0d Data = %0d",addr,data);
endfunction
    
module example;
  initial begin
    packet p = new();
    p.display(20,30);
  end
endmodule   

// OUTPUT
Addr = 20 Data = 30
