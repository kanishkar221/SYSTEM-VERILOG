module datatype;
  logic [3:0] a;
  logic [7:0] b;
  logic signed [7:0] c;
  logic [7:0] d;

  initial begin
    a = 4'bxz11;         
    b = 8'hFF;           
    c = 8'd10;          
    d = 8'bzzxx_1010;    
  end

  initial begin
    $display("a = %b", a);
    $display("b = %b", b);
    $display("c = %0d", c);
    $display("d = %b", d);
    #10 $finish;
  end
endmodule
