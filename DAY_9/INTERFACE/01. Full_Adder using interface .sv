//Design Code
module half_addr(input a, b, output so, co);
  assign so = a ^ b;
  assign co = a & b;
endmodule

module full_adder(fa_if inf);
  wire s0, c0, c1;
  half_addr HA1 (inf.a, inf.b, s0, c0);
  half_addr HA2 (s0, inf.c, inf.s_out, c1);
  
  assign inf.c_out = c0 | c1;
endmodule

//Interface
interface fa_if;          
  logic a, b, c;
  logic s_out, c_out;
endinterface

//Top Module
module tb_top;           
  fa_if inf();
  full_adder fa(inf);
  
  initial begin
    $monitor("a=%b b=%b c=%b,sum=%b,carry=%b",inf.a,inf.b,inf.c,inf.s_out,inf.c_out);
    inf.a = 1; inf.b = 0; inf.c = 0;
    #1;
    inf.a = 1; inf.b = 1; inf.c = 1;
    #1;
    inf.a = 0; inf.b = 1; inf.c = 1;
  end
endmodule

