module while_loop;
  logic [2:0] count;
  logic [3:0] mem [7:0];
  
  initial begin
    count = 4;
    while(count)
      begin
        mem[count] = $urandom;
        $display("mem[%0d] = %0h",count,mem[count]);
        count--;
      end
  end
endmodule

OUTPUT:
  mem[4] = 1
  mem[3] = 5
  mem[2] = 7
  mem[1] = 0
