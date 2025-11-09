module PU;
  logic [31:0] v1 [7:0]; 
  initial begin
    v1[7] = 'hffffffff;
    $display("v1[7] = %h", v1[7]);
    v1[6] = 'h11111111;
    $display("v1[6] = %h", v1[6]);
    v1[5][15:0] = 'haaaa;
    $display("v1[5] = %h", v1[5]);
    v1[4][0] = 1'b1;
    $display("v1[4] = %h", v1[4]);
  end
endmodule

