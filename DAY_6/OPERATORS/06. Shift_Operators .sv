module operators;
  logic [3:0] a, b;
  initial begin
    a = 4'b1011;
    b = 4'b1111;

    $display("Value of a = %b", a);
    $display("Value of b = %b", b);
	//Logical shift
    $display("Logical left shift (a << 1)  = %b", a << 1);
    $display("Logical right shift (a >> 1) = %b", a >> 1);
	//Arithmetic shift
    $display("Arithmetic left shift (a <<< 1)  = %b", a <<< 1);
    $display("Arithmetic right shift (a >>> 1) = %b", a >>> 1);
  end
endmodule
