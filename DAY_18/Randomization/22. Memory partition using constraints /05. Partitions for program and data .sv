// Partitions for program and data
class memory_block;
  int total_mem;
  rand int pgm[], data[], space[];
  rand int max_pgms, max_pgm_size, max_data_size;
  rand int num_pgm, num_data, num_space;
  
  // Constraint: Define the valid number of programs, data blocks, and spaces
  constraint nums {
    num_pgm inside {[1:max_pgms]};
    num_data inside {[1:10]};
    num_space inside {[1:10]};
  }
  
  // Constraint: Define maximum values for programs and data
  constraint maxs {
    max_pgms == 10;
    max_pgm_size == 512;
    max_data_size == 128;
  }
  
  // Constraint: Ensure array sizes match their respective counts
  constraint arrays {
    pgm.size() == num_pgm;
    data.size() == num_data;
    space.size() == num_space;
  }
  
  // Constraint: Define valid memory allocation rules
  constraint ram {
    foreach (pgm[i]) {
      // program mostly betweenn 128 - 512, some between 32-64
      pgm[i] dist {[128:max_pgm_size]:=75,[32:64]:/25};
      // programs must be aligned 4 byte boundaries
      pgm[i] % 4 == 0;
    }
      
    foreach (data[i]) {
      // each data block must be exactly 64 bytes
      data[i] inside {[64:max_data_size]};
      data[i] % 4 == 0;
    }
      
      foreach (space[i]) {
        // Allowed space sizes
        space[i] inside {64,128,512};
      }
      
      // // Total memory must match allocated sum
      total_mem == pgm.sum() + data.sum() + space.sum();
  }
  
  // Function to display memory allocation details
  function void display();
    $display("Total_RAM: %0d", total_mem);
    $display("No. of Programs: %0d", num_pgm);
    $display("No. of Data blocks: %0d", num_data);
    $display("No. of Spaces: %0d", num_space);
    $display("Total Program size: %0d, Total data size: %0d, Total space size: %0d \n",pgm.sum(), data.sum(), space.sum());
    
    foreach (pgm[i])
      $display("Program_%0d is of %0d bytes",i,pgm[i]);
    foreach (data[i])
      $display("Data_%0d is of %0d bytes",i,data[i]);
    foreach (space[i])
      $display("Space_%0d is of %0d bytes",i,space[i]);
  endfunction
endclass

// Module to instance and test memory allocation
module memory_pgm_data();
  memory_block mb;
  initial begin
    mb = new();
    mb.total_mem = 6144;   // set total memory size 6 kb
    mb.randomize(); // Randomize memory allocation
    mb.display();          // Display alloacation details
  end
endmodule

// OUTPUT
Total_RAM: 6144
No. of Programs: 7
No. of Data blocks: 8
No. of Spaces: 9
Total Program size: 2424, Total data size: 712, Total space size: 3008 

Program_0 is of 464 bytes
Program_1 is of 404 bytes
Program_2 is of 128 bytes
Program_3 is of 400 bytes
Program_4 is of 328 bytes
Program_5 is of 264 bytes
Program_6 is of 436 bytes
Data_0 is of 80 bytes
Data_1 is of 116 bytes
Data_2 is of 76 bytes
Data_3 is of 72 bytes
Data_4 is of 72 bytes
Data_5 is of 124 bytes
Data_6 is of 96 bytes
Data_7 is of 76 bytes
Space_0 is of 512 bytes
Space_1 is of 128 bytes
Space_2 is of 512 bytes
Space_3 is of 512 bytes
Space_4 is of 128 bytes
Space_5 is of 512 bytes
Space_6 is of 512 bytes
Space_7 is of 64 bytes
Space_8 is of 128 bytes
