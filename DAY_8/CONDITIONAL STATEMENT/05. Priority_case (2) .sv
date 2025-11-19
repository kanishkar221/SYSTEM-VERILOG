module priority_case;   //4-bit priority encoder
  logic [3:0] in;
  logic [1:0] out;
  always @* begin
    priority casez (in)
      4'b1??? : out = 2'b11;   // highest priority
      4'b01?? : out = 2'b10;
      4'b001? : out = 2'b01;
      4'b0001 : out = 2'b00;   // lowest priority
      default : out = 2'b00;   // no bits set
    endcase
  end
  initial begin
    in = 4'b0001; #10; 
    $display("in=%b  out=%b", in, out);
    in = 4'b0010; #10; 
    $display("in=%b  out=%b", in, out);
    in = 4'b0100; #10; 
    $display("in=%b  out=%b", in, out);
    in = 4'b1000; #10; 
    $display("in=%b  out=%b", in, out);
    in = 4'b1101; #10; 
    $display("in=%b  out=%b", in, out);
  end
endmodule
