2. Create a typdef Instr_t of struct for the instruction and then declare the memory as array of Instr_t.

// CODE
module structure;
  typedef struct{
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] c;
    logic [3:0] d;
  }Instr_t;
  
  Instr_t mem [3:0];
  
  initial begin
    mem[0].a = 4'b0001;   // 1
    mem[1].b = 4'b1111;   // 15
    mem[2].c = 4'b1010;   // 10
    mem[3].d = 4'b0111;   // 7
     
    $display("Memory = %p",mem);
  end
endmodule

// OUTPUT
Memory = '{'{a:x, b:x, c:x, d:7}, '{a:x, b:x, c:10, d:x}, '{a:x, b:15, c:x, d:x}, '{a:1, b:x, c:x, d:x}}
