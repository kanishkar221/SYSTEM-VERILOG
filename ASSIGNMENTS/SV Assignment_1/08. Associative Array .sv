8.Write a test bench to test the Associative array data type and its predefined methods by using the following statements
	a. declare a 64-bit integer type sparse array assoc & an index idx
	b. initialize idx to 1
	c. fill array assoc by 1-bit left shift of idx value in a loop which runs 64 times so that the array is filled as a sparse array
	d. use first, next, last, prev methods to get the values of these elements

// CODE 

module associative_array;
  longint assoc[int];
  int idx;
  initial begin
    idx=1;
    repeat(64) begin
      assoc[idx] = idx;
      idx = idx << 1;
    end
    $display("First value");
    if(assoc.first(idx))
      $display("First = %0d",idx,assoc[idx]);
    
    $display("Next value");
    if(assoc.next(idx))
      $display("Next = %0d ",idx,assoc[idx]);
    
    $display("Last value");
    if(assoc.last(idx))
      $display("Next = %0d",idx,assoc[idx]);
    
    $display("Previous value");
    if(assoc.prev(idx))
      $display("Previous = %0d",idx,assoc[idx]);
  end
endmodule
        
