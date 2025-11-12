module string_int;
  string s;
  int i;
  initial begin
    s = "12345ff12";
    i = s.atoi();
    $display("String to integer" , i);
    i = i+100;
    $display("i+100",i);
    i = i-50;
    $display("i-50",i);
    i = i*2;
    $display("i*2",i);
    i = i/2;
    $display("i/2",i);
    i = i%2;
    $display("i%2",i);
  end
endmodule

