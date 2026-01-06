// 1. Memory Block Randomization
class memory_block;
  bit [31:0] mem_ram_start, mem_ram_end;
  rand bit [31:0] mem_start_addr,mem_end_addr;
  rand int mem_block_size;
  
  constraint mem {
    mem_start_addr >= mem_ram_start;
    mem_start_addr < mem_ram_end;
    mem_start_addr % 4 == 0;
    mem_end_addr == mem_start_addr + mem_block_size - 1;
  }
  
  constraint block_size {
    mem_block_size inside {32, 64};
  }
  
  function void display();
    $display("Memory Block");
    $display("RAM start addr:%0d", mem_ram_start);
    $display("RAM end addr:%0d", mem_ram_end);
    $display("BLOCK start addr:%0d", mem_start_addr);
    $display("BLOCK end addr:%0d", mem_end_addr);
    $display("BLOCK SIZE:%0d", mem_block_size);
  endfunction
endclass

module single_memory_block();
  memory_block memb = new();
  initial begin
    memb.mem_ram_start = 32'h0;
    memb.mem_ram_end = 32'h7ff;
    void'(memb.randomize());
    memb.display();
  end
endmodule

// OUTPUT
Memory Block
RAM start addr:0
RAM end addr:2047
BLOCK start addr:416
BLOCK end addr:479
BLOCK SIZE:64
