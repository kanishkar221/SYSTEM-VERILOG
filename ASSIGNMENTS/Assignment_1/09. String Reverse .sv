module reverse_string;
  string s;
  string rev_s;
  initial begin
    s = "SystemVerilog";
    $display("Before the reverse = %s", s);
    for (int i = s.len() - 1; i >= 0; i--) 
      rev_s = {rev_s, s[i]};
    $display("After the reverse = %s", rev_s);
  end
endmodule
