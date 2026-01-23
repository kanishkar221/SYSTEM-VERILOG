// 01. Coverpoints using value
module cover_point;
  bit [3:0] a;     // 4 bit variable 'a'
  bit [3:0] arr[4] = '{2,5,0,12};   // 4 element with predefined values
  
  // Define a covergroup to track coverage of 'a'
  covergroup cg;
    a1: coverpoint a;   // Coverpoint for variable 'a'
  endgroup
  
  cg cg_inst;     // Instantiate covergroup
  
  initial begin
    cg_inst = new();
    
    // Iterate the over elements
    foreach (arr[i]) begin
      a = arr[i];           // Assign array values to a
      cg_inst.sample();     // Sample the covergroup
      
      // Display current value and coverage percentage
      $display("a=%d coverage %% = %0.2f",a, cg_inst.get_inst_coverage());
    end
  end
endmodule

// OUTPUT
a= 2 coverage % = 6.25
a= 5 coverage % = 12.50
a= 0 coverage % = 18.75
a=12 coverage % = 25.00
