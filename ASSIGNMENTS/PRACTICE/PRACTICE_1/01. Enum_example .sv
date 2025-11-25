module enum_data_types;
  typedef enum logic [1:0]{
    IDLE = 2'b00,
    RUN  = 2'b01,
    STOP = 2'b10
  } state_t;
  
  logic clk, reset, start;
  state_t current_state;

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  always_ff @(posedge clk) begin    // Sequential logic 
    if (reset)
      current_state <= IDLE;
    else if (start)
      current_state <= RUN;
    else
      current_state <= STOP;
  end
  
  initial begin
    reset = 1;
    start = 0;
    #5;          
    
    reset = 0;    
    start = 1;
    #10;          
    
    $display("Final state = %0d", current_state);
    $finish;
  end
endmodule
