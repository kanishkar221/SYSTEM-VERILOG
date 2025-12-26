// AND gate design module
module andg (
    input  logic input_a,
    input  logic input_b,
    output logic output_y
);
    assign output_y = input_a & input_b;
endmodule

// Interface
interface and_if;
  logic input_a;
  logic input_b;
  logic output_y;
endinterface : and_if

// Testbench module
module tb (and_if inf);
  initial begin
    $display("\n// AND gate output");
    $monitor("input_a=%b\t input_b=%b\t output_y=%b",
                  inf.input_a, inf.input_b, inf.output_y);
    inf.input_a = 0; inf.input_b = 0;
    #1;
    inf.input_a = 1; inf.input_b = 0;
    #1;
    inf.input_a = 0; inf.input_b = 1;
    #1;
    inf.input_a = 1; inf.input_b = 1;
    #1;
    $finish;
    end
endmodule

// Top module
module top;
  and_if inf();   // Interface instance
  
  // Design module instantiation
  andg a1 ( 
    .input_a (inf.input_a),
    .input_b (inf.input_b),
    .output_y(inf.output_y)
  );
  tb a2 (inf);   // Testbench instantiation
endmodule

// OUTPUT
// AND gate output
input_a=0	 input_b=0	 output_y=0
input_a=1	 input_b=0	 output_y=0
input_a=0	 input_b=1	 output_y=0
input_a=1	 input_b=1	 output_y=1
