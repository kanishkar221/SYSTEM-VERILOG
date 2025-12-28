module random_function;
  integer a;
  integer d;
  logic [2:0] b;
  bit [5:0] e;
  byte c;
  
  initial begin
    a = $random();
    b = $urandom();
    c = $urandom_range(4,2);
    d = $random(23);
    e = $urandom(4);
    $display("a = $random()");
    $display("Random Value of a = %0d",a);
    $display("b = $urandom()");
    $display("Random Value of b = %0d",b);
    $display("c = $urandom_range(4,2)");
    $display("Random Value of c = %0d",c);
    $display("$random(seed)");
    $display("d = $random(23)");
    $display("Random Value of d = %0d",d);
    $display("$urandom(seed)");
    $display("e = $urandom(4)");
    $display("Random Value of e = %0d",e);
  end
endmodule

// OUTPUT
a = $random()
Random Value of a = 303379748
b = $urandom()
Random Value of b = 4
c = $urandom_range(4,2)
Random Value of c = 4
$random(seed)
d = $random(23)
Random Value of d = -2145894912
$urandom(seed)
e = $urandom(4)
Random Value of e = 52
