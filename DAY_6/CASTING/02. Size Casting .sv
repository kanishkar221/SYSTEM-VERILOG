module size_casting;
  logic [15:0] a, b, c, sum;
  logic carry;
  initial begin
    $monitor("a=%0d b=%0d c=%0d sum=%0d carry=%0d", a, b, c, sum, carry);
    // Size casting constant values to 16 bits
    a = 16'(6);       
    b = 16'(3);
    c = 16'(9);
    #10;
    sum = a + 16'(5);          // Add a with 5 (5 is casted to 16 bits)
    #10;
    {carry, sum} = 17'(a + b); // Cast (a+b) to 17 bits so MSB becomes carry
    #10;
    sum = a + (16'(b - 2))/c;  // (b-2) is cast to 16 bits before division   
    #10;
  end
endmodule

OUTPUT
    a=6 b=3 c=9 sum=x carry=x
    a=6 b=3 c=9 sum=11 carry=x
    a=6 b=3 c=9 sum=9 carry=0
    a=6 b=3 c=9 sum=6 carry=0

