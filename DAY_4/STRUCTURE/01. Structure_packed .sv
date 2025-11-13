module packed_structure;
  struct packed {                    //packed structure
    bit [7:0] intr;
    logic [23:0] addr;
  } SUR;
  
  initial begin
    SUR.intr = 'hFX;
    $display("SUR = %h",SUR);
    $display("SUR intr = %h",SUR.intr);
    
    SUR = '{'h00,'hFF_FF_FF};
    $display("SUR = %h",SUR);
    
    SUR = 0;
    SUR = SUR + 'h15;
    $display("SUR = %h",SUR);
  end
endmodule          
             
