// 2. Memory n equal partitions
class memory_block;
  // Start and End address of RAM
  bit [31:0] mem_ram_start, mem_ram_end;
  // Number of partition and size of each partition
  rand int mem_num_parts, mem_part_size;
  // Array to store start addresses of partitions
  rand bit [31:0] mem_part_start[];
  
  // Constraint : Number of partitions should be between 2 and 8
  constraint parts {
    mem_num_parts >= 2;
    mem_num_parts <= 8;
  }
  
  // Constraint : Each partition should have an equal size
  constraint part_size {
    mem_part_size == (mem_ram_end - mem_ram_start) / mem_num_parts + 1;
  }
  
  // Constraint : Ensure proper partitioning with consecutive addresses
  constraint partition {
    // Array size must match the size of partitions
    mem_part_start.size() == mem_num_parts;
    foreach (mem_part_start[i])
      if (i)
        // Next partition starts after the previous one
        mem_part_start[i] == mem_part_start[i-1] + mem_part_size;
    else
      // First partition starts at RAM start address
      mem_part_start[i] == mem_ram_start;
  }
  
  // Function to display memory partition details
  function display();
    $display("RAM start addr:%0d",mem_ram_start);
    $display("RAM end addr:%0d",mem_ram_end);
    $display("No. of partitions:%0d",mem_num_parts);
    $display("Size of each partition:%0d",mem_part_size);
    $display("Partitions");
    
    // Display each partitions start an end addresses
    foreach (mem_part_start[i]) begin
      // Last partition extends to RAM end
      if (i == mem_num_parts - 1)
        $display("Partition:%0d from %0d to %0d",i+1, mem_part_start[i], mem_ram_end);
      else
        // Other partitions are within allocated sizes
        $display("Partition:%0d from %0d to %0d", i+1, mem_part_start[i], mem_part_start[i+1] - 1);
    end
  endfunction
endclass

module memory_n_equal_partitions();
  memory_block memb = new();  // Create an instance of memory_block
  initial begin
    memb.mem_ram_start = 32'h0; // Set RAM start address
    memb.mem_ram_end = 32'h7ff; // Set RAM end address
    void'(memb.randomize());    // Randomize partitions
    void'(memb.display());      // Display partition details
  end
endmodule

// OUTPUT
RAM start addr:0
RAM end addr:2047
No. of partitions:8
Size of each partition:256
Partitions
Partition:1 from 0 to 255
Partition:2 from 256 to 511
Partition:3 from 512 to 767
Partition:4 from 768 to 1023
Partition:5 from 1024 to 1279
Partition:6 from 1280 to 1535
Partition:7 from 1536 to 1791
Partition:8 from 1792 to 2047
