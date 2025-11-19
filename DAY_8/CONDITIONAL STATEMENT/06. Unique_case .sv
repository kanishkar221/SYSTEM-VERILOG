module unique_case_example; // 4-bit priority encoder
  logic [3:0] in;
  logic [1:0] out;
  always @* begin
    unique case (1'b1)
      in[3] : out = 2'b11;   // highest priority
      in[2] : out = 2'b10;
      in[1] : out = 2'b01;
      in[0] : out = 2'b00;   // lowest priority
      default: out = 2'b00;
    endcase
  end
  initial begin
    in = 4'b0001; #10; 
    $display("in=%b out=%b", in, out);
    in = 4'b0010; #10; 
    $display("in=%b out=%b", in, out);
    in = 4'b0100; #10; 
    $display("in=%b out=%b", in, out);
    in = 4'b1000; #10; 
    $display("in=%b out=%b", in, out);
    in = 4'b1101; #10; 
    $display("in=%b out=%b", in, out);
  end
endmodule
 
