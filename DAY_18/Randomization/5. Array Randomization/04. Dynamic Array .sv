// Dynamic Array
class class_1;
  // Declare a dynamic array of 8bit elements with cyclic randomization
  randc bit [7:0] dyn_arr[];
  // Constraint : Ensure dynamic array size is between 4 and 6
  constraint dyn_arr_size {
    dyn_arr.size() > 3; 
    dyn_arr.size() < 7;
  }
  // Constraint : Each element of the array must be square of its index
  constraint dyn_arr_ele {
    foreach (dyn_arr[i])
      dyn_arr[i] == i*i;
  }
endclass

module mod;
  class_1 pack;
  initial begin
    pack = new();
    for (int i=0;i<=2;i++) begin
      void'(pack.randomize());
      $display("Iteration=%0p, Array=%0p",i,pack.dyn_arr);
    end
  end
endmodule

// OUTPUT
Iteration=0, Array=0 1 4 9 16
Iteration=1, Array=0 1 4 9 16
Iteration=2, Array=0 1 4 9 16 25
