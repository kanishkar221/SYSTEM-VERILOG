//Design
module multiplier(mult_if.RTL inf);
  
  always@(posedge inf.clk or posedge inf.reset) begin 
    if(inf.reset) begin 
      inf.out <= 0;
      inf.ack <= 0;
    end
    else if(inf.en) begin
      inf.out <= inf.a * inf.b;
      inf.ack <= 1;
    end
    else inf.ack <= 0;
  end
endmodule

//Interface
interface mult_if (input logic clk, reset);
  logic [7:0] a, b;
  logic [15:0] out;
  logic en;
  logic ack;
  
  clocking cb @(posedge clk);
    default input #1 output #2;
    input out, ack; //input signals is sampled #1 time unit before the clocking event
    output a,b, en; //output signals are driven after #2 time units after the clocking event
  endclocking
  
  modport TB (clocking cb, input clk, reset);
  modport RTL (input clk, reset, a,b, en, output out, ack);
  
endinterface

// top module
module tb_top;       
  bit clk;
  bit reset;
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #2;
    reset = 0;
  end 
  
  mult_if inf(clk, reset);
  multiplier DUT(inf);
  
  `define TB_IF inf.TB.cb
   
  initial begin
    #5;
    `TB_IF.a <= 'd5; `TB_IF.b <= 'd6;    
    `TB_IF.en <= 1;
    #10 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);   //time = 15: a=  5 b=  6, out=   30
    
    #25;
    `TB_IF.a <= 'd20; `TB_IF.b <= 'd7;
    #5ns `TB_IF.en <= 1;
    #6 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);    //time = 54: a= 20 b=  7, out=  140

    #10;
    $finish;
  end
endmodule

OUTPUT 
    time = 15: a=  5 b=  6, out=   30
    time = 54: a= 20 b=  7, out=  140
