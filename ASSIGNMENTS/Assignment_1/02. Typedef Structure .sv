module structure;
  typedef struct{
    logic [7:0] opcode;
    logic [3:0] addr;
    bit [3:0] src;
    bit [3:0] dst;
  }Instr_t;
  
  Instr_t mem[3:0];
  initial begin
    mem[0].opcode = 8'b1101_1001;
    mem[1].addr = 4'b1111;
    mem[2].src = 4'b0001;
    mem[3].dst = 4'b1010;
  	$display(mem);
  end
endmodule
