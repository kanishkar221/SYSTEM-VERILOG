module queue;  
  int a[$];
  task push_data;
    begin
      a.push_front(28);
      a.push_back(16);
    end
  endtask
  
  task remove_data;
    begin
      a.pop_front();
      a.pop_back();
    end
  endtask
  
  initial begin
    a = '{12,28,5,16,18};
    $display("A is :%0p",a);
    push_data;
    $display("A is :%0p",a);
    remove_data;
    $display("A is :%0p",a);
  end
endmodule
   
