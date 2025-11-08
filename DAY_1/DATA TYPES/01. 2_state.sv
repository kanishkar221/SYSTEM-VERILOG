module data_type;
  bit [7:0] a;
  byte b;
  shortint s;
  int i;
  longint l;

  initial begin
    a = 2;
    b = -1;
    s = 20;
    i = 'hffff_fxfx;
    l = 'hffff_fxfx_ffff_zzzz;
  end

  initial begin
    $display("bit = %0d", a);
    $display("byte  = %0d", b);
    $display("shortint  = %0d", s);
    $display("int  = %0h", i);
    $display("longint = %0h", l);
    #10 $finish;
  end
endmodule
