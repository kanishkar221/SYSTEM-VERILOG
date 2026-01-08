// 4. Memory partitions with spaces in between
class memory_block;
  bit [31:0] mem_ram_start, mem_ram_end;
  rand int mem_num_parts;   // number of partitions
  rand int mem_part_size[]; // Array of partition sizes
  rand int mem_space[];     // Array for spaces between partitions
  rand bit [31:0] mem_part_start[];  // Array for partition start addresses
  
  // Constraint: The number of partitions should be between 5 and 9
  constraint parts {
    mem_num_parts > 4;
    mem_num_parts < 10;
  }
  
  // // Constraint: Ensure partition sizes and spaces sum up to the total memory size
  constraint part_sizes {
    // Ensure partition size array matches number of partitions
    mem_part_size.size() == mem_num_parts;
    // Space array should be one less than partition count
    mem_space.size() == mem_num_parts - 1;
    // Total memory usage must match RAM size
    mem_part_size.sum() + mem_space.sum() == mem_ram_end - mem_ram_start + 1;
    
    // Each partition size should be from a predefined set
    foreach (mem_part_size[i]) {
      mem_part_size[i] inside {256, 512, 1024, 2048};
      if(i < mem_space.size())
        mem_space[i] inside {64, 256, 512, 1024};
    }
  }
      
  // Constraint: Ensure proper memory partitioning with consecutive addresses      
  constraint partition {
    // Ensure start address array matches number of partitions
    mem_part_start.size() == mem_num_parts;
    foreach (mem_part_start[i])
      if(i)
        // Next partition starts after the previous one
        mem_part_start[i] == mem_part_start[i - 1] + mem_part_size[i - 1];
      else
        // First partition starts at RAM start address
        mem_part_start[i] == mem_ram_start;
  }
  
  // Function to display memory partition details
  function display();
    $display("RAM start addr:%0d", mem_ram_start);
    $display("RAM end addr:%0d", mem_ram_end);
    $display("No. of partitions:%0d", mem_num_parts);
    $display("mem_part_size:%0p", mem_part_size);
    $display("mem_space:%0p", mem_space);
    $display("Partitions");
    
    // Display each partition's start, size, and end addresses, including spaces
    foreach (mem_part_start[i]) begin
      // Last partition extends to RAM end
      if(i == mem_num_parts - 1)
        $display("Partition:%0d with size:%0d from %0d to %0d", i, mem_part_size[i], mem_part_start[i] + mem_space[i-1], mem_ram_end);
      else if (i == 0)   // First Partition
        $display("Partition:%0d with size:%0d from %0d to %0d space_part:%0d bytes", i, mem_part_size[i], mem_part_start[i], mem_part_start[i+1] - 1, mem_space[i]);
      else              // Intermediate partitions with space
        $display("Partition:%0d with size:%0d from %0d to %0d space_part:%0d bytes",i, mem_part_size[i], mem_part_start[i] + mem_space[i-1],mem_part_start[i+1] - 1, mem_space[i]);
    end
  endfunction
endclass
    
module memory_partition_with_space();
  memory_block memb = new();
  initial begin
    memb.mem_ram_start = 32'h0;   // set RAM start address
    memb.mem_ram_end = 32'h23ff;  // set RAM end address
    // Randomize partitions sizes and spaces with 5 partitions
    void'(memb.randomize() with {mem_num_parts == 5;});
    // Display partition details
    void'(memb.display());
  end
endmodule    

// OUTPUT
RAM start addr:0
RAM end addr:9215
No. of partitions:5
mem_part_size:1024 512 2048 2048 512
mem_space:512 512 1024 1024
Partitions
Partition:0 with size:1024 from 0 to 1023 space_part:512 bytes
Partition:1 with size:512 from 1536 to 1535 space_part:512 bytes
Partition:2 with size:2048 from 2048 to 3583 space_part:1024 bytes
Partition:3 with size:2048 from 4608 to 5631 space_part:1024 bytes
Partition:4 with size:512 from 6656 to 9215
