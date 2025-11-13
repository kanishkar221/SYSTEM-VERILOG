module unpacked_structure;
  struct {              //unpacked structure
    bit [7:0] intr;
    logic [23:0] addr;
  } SUR;
  
  initial begin
    SUR.intr = 'hFF;             //single field
    $display("SUR = %p",SUR);
    $display("SUR intr = %h",SUR.intr);
    
    SUR = '{'h00,'hFF};          //all fields
    $display("SUR = %p",SUR);
  end
endmodule
