class packet;
  bit [31:0] addr;
  static bit [31:0] id;
  
  function display(bit[31:0]a,b);
    $display("Values are %0d %0d",a,b);
  endfunction
endclass

module example;
  int id = 10;
  initial begin
    packet p = new();
    packet :: id = 20;
    p.display(packet :: id,id);
  end
endmodule

// OUTPUT
Values are 20 10
