module associative_array;
  int assoc_array1[string];
  int assoc_array2[string];
  task compare;
    foreach(assoc_array1[i])
      if(assoc_array1[i]==assoc_array2[i])
        $display("Associative arrays are equal",assoc_array1[i],assoc_array2[i]);
      else
        $display("Associative arrays are not equal",assoc_array1[i],assoc_array2[i]);
  endtask
  
  initial begin
    assoc_array1["districts"]=38;
    assoc_array1["states"]=28;
    assoc_array2=assoc_array1;
    compare();
  end
endmodule
 
