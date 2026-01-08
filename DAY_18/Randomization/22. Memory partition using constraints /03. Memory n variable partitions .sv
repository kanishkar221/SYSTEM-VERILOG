// 3. Memory n variable partitions
class memory_block;
  bit [31:0] mem_ram_start, mem_ram_end;
  rand int mem_num_parts;
  rand int mem_part_size[];
  rand bit [31:0] mem_part_start[];
  
  constraint parts {
    mem_num_parts >= 2;
    mem_num_parts <= 8;
  }
  
  constraint part_sizes {
    mem_part_size.size() == mem_num_parts;
    mem_part_size.sum() == mem_ram_end - mem_ram_start + 1;
    foreach (mem_part_size[i])
      mem_part_size[i] inside {16,32,64,128,256,512,1024,2048,4096};
  }
  
  constraint partition {
    mem_part_start.size() == mem_num_parts;
    foreach (mem_part_start[i])
      if(i)
        mem_part_start[i] == mem_part_start[i-1] + mem_part_size[i-1];
      else
        mem_part_start[i] == mem_ram_start;
  }
  
  function display();
    $display("RAM start addr:%0d", mem_ram_start);
    $display("RAM end addr:%0d",mem_ram_end);
    $display("No. of partitions:%0d", mem_num_parts);
    $display("Partitions");
    
    foreach (mem_part_start[i]) begin
      if(i == mem_num_parts - 1)
        $display("Partition:%0d with size:%0d from %0d to %0d", i,mem_part_size[i], mem_part_start[i], mem_ram_end);
      else
        $display("Partition:%0d with size:%0d from %0d to %0d", i,mem_part_size[i], mem_part_start[i], mem_part_start[i+1] - 1);
    end
  endfunction
endclass

module memory_n_var_partitions();
  memory_block memb = new();
  initial begin
    memb.mem_ram_start = 32'h0;
    memb.mem_ram_end = 32'h3fff;
    void'(memb.randomize());
    void'(memb.display());
  end
endmodule

// OUTPUT
RAM start addr:0
RAM end addr:16383
No. of partitions:8
Partitions
Partition:0 with size:512 from 0 to 511
Partition:1 with size:2048 from 512 to 2559
Partition:2 with size:2048 from 2560 to 4607
Partition:3 with size:1024 from 4608 to 5631
Partition:4 with size:4096 from 5632 to 9727
Partition:5 with size:2048 from 9728 to 11775
Partition:6 with size:4096 from 11776 to 15871
Partition:7 with size:512 from 15872 to 16383
