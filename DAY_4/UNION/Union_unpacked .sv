module union_unpacked;
  logic [31:0] x;

  typedef union {
    int a;
    bit [31:0] b;
    bit [31:0] c;
  } data;
  data d1;
  initial begin
    d1.a = 32'hffff_ffff;
    x = d1.b;
    $display("x = %h",x);

    d1.b = 8'h10;
    x = d1.c;
    $display("x = %h",x);
    
    d1.c = 16'h1111;
    x = d1.a;
    $display("x = %h",x);
  end
endmodule
