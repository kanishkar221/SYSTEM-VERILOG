// Design
module up_counter (clk,reset,counter);
  input logic clk,reset;
  output logic [2:0] counter;
  reg [2:0] counter_up;
  always @(posedge clk or posedge reset) begin
    if(reset)
      counter_up <= 3'd0;
    else
      counter_up <= counter_up + 3'd1;
  end
  assign counter = counter_up;
endmodule

// Interface
interface count_if #(parameter N=2);
  logic reset,clk;
  logic [N:0] counter;
endinterface

// Top Module
module top();
  count_if inf();
  up_counter u1(
    .clk(inf.clk),
    .reset(inf.reset),
    .counter(inf.counter)
  );
  up_testbench u2(inf);
endmodule

// Testbench
module up_testbench(count_if inf);
  initial begin
    $display("\n //Parameterised interface example");
    $monitor("\n count=%0d",inf.counter);
    inf.clk = 0;
    forever #5 inf.clk=~inf.clk;
  end
  initial begin
    inf.reset=1;
    #20;
    inf.reset=0;
    #70;
    $finish;
  end
endmodule

// OUTPUT
// Parameterised interface example
count=0
count=1
count=2
count=3
count=4
count=5
count=6
count=7
