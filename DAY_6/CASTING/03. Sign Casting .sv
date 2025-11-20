module sign_casting;
  int a;
  bit [31:0] b;

  initial begin
    a = 255;            //signed int=255
    b = unsigned'(a);   //cast to unsigned 32 bit -m remains 255
    $display("a=%0d b=%0d", a, b);
    b = 47;             // 32 bit signed of 47       
    a = signed'(b);     // b s signed int (47)
    $display("a=%0d b=%0d", a, b); 
  end
endmodule

OUTPUT
    a=255 b=255
    a=47 b=47
