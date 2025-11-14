module operator;
  bit [3:0] a = 4'b1011;
  bit [3:0] b = 4'b0101;
  initial begin
    $display("a & b = %b", a & b);
    $display("a | b = %b", a | b);
    $display("a ^ b = %b", a ^ b);
    $display("~a = %b", ~a);
  end
endmodule
