module datatype1;
  integer a;
  int b;
  shortint c;
  longint d;         
  logic [7:0] l1;
  logic signed [7:0] sl1;
  byte bl1;
  reg [7:0] r1;
  
  initial begin
    a = 'hxxzz_ffff;
    b = -1;
    c = 'hfxfx;
    d = 'hffff_xxxx_ffff_zzzz;
    l1 = -1;
    sl1 = -1;
    bl1 = -1;
    r1 = 8'bxzxz_0101;
  end
  
  initial begin
    #10;
    $display("a = %h  b = %h  c = %h  d = %h", a, b, c, d);
    $display("l1 = %0d  sl1 = %0d  bl1 = %0d  r1 = %b", l1, sl1, bl1, r1);
    #10 $finish(2);
  end
endmodule

