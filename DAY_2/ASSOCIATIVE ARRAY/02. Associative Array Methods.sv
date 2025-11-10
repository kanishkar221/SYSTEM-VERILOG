module sparse;
  longint assoc[int];
  int idx;
  initial begin
    idx=1;
    repeat(64)
      begin
      	assoc[idx] = idx;
      	idx = idx << 1;
      end
    $display("First value");
    if(assoc.first(idx))
      $display(idx,",",assoc[idx]);
    
    $display("Next value");
    if(assoc.next(idx))
      $display(idx,",",assoc[idx]);
    
    $display("Last value");
    if(assoc.last(idx))
      $display(idx,",",assoc[idx]);
    
    $display("Previous value");
    if(assoc.prev(idx))
      $display(idx,",",assoc[idx]);
  end
endmodule
