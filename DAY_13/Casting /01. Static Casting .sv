module casting;
  real r;
  int i;
  initial begin
    r = (11 * 2);
    i = int'(11* 2);
    $display("Real value is %f",r);
    $display("Int value is %0d",i);
  end
endmodule

// OUTPUT
Real value is 22.000000
Int value is 22
