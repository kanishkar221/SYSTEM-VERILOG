class without_solve_before;
  rand bit value1;
  rand bit [3:0] value2;
  // Constraint: If value1 is 1, then value2 must be 1
  constraint val {value1 == 1 -> value2 == 1;}
endclass

class with_solve_before;
  rand bit value1;
  rand bit [3:0] value2;
  // Constraint: Ensure value1 is solved before value2 
  constraint valu {
    value1 == 1 -> value2 == 1;
    solve value1 before value2;  // Solve value1 first before randomizing value2
  }
endclass

module solve_before();
  // Create instances of both classes  
  without_solve_before gen1 = new();
  with_solve_before gen2 = new();
  initial begin
    $display("Without solve before");
    for (int i=1;i<=32;i++) begin
      void'(gen1.randomize());
      #1 $display ("\t [%0t] @ iteration:%0d value1:%0d \t value2:%0d", $time,i,gen1.value1, gen1.value2);
    end
    $display("With solve before");
    for (int i=1;i<=10;i++) begin
      void'(gen2.randomize());
      #1 $display("\t [%0t] @ iteration:%0d value1:%0d \t value2:%0d", $time,i,gen1.value1, gen1.value2);
    end
  end
endmodule

// OUTPUT
Without solve before
[1] @ iteration:1 value1:0 	 value2:6
[2] @ iteration:2 value1:0 	 value2:0
[3] @ iteration:3 value1:0 	 value2:1
[4] @ iteration:4 value1:0 	 value2:6
[5] @ iteration:5 value1:0 	 value2:13
[6] @ iteration:6 value1:0 	 value2:7
[7] @ iteration:7 value1:0 	 value2:4
[8] @ iteration:8 value1:0 	 value2:10
[9] @ iteration:9 value1:1 	 value2:1
[10] @ iteration:10 value1:0 	 value2:2
[11] @ iteration:11 value1:0 	 value2:14
[12] @ iteration:12 value1:0 	 value2:11
[13] @ iteration:13 value1:0 	 value2:0
[14] @ iteration:14 value1:0 	 value2:2
[15] @ iteration:15 value1:0 	 value2:10
[16] @ iteration:16 value1:0 	 value2:7
[17] @ iteration:17 value1:0 	 value2:10
[18] @ iteration:18 value1:0 	 value2:12
[19] @ iteration:19 value1:0 	 value2:15
[20] @ iteration:20 value1:0 	 value2:12
[21] @ iteration:21 value1:0 	 value2:0
[22] @ iteration:22 value1:0 	 value2:11
[23] @ iteration:23 value1:1 	 value2:1
[24] @ iteration:24 value1:0 	 value2:10
[25] @ iteration:25 value1:0 	 value2:6
[26] @ iteration:26 value1:1 	 value2:1
[27] @ iteration:27 value1:0 	 value2:14
[28] @ iteration:28 value1:0 	 value2:9
[29] @ iteration:29 value1:0 	 value2:15
[30] @ iteration:30 value1:0 	 value2:1
[31] @ iteration:31 value1:0 	 value2:2
[32] @ iteration:32 value1:0 	 value2:15
With solve before
[33] @ iteration:1 value1:0 	 value2:15
[34] @ iteration:2 value1:0 	 value2:15
[35] @ iteration:3 value1:0 	 value2:15
[36] @ iteration:4 value1:0 	 value2:15
[37] @ iteration:5 value1:0 	 value2:15
[38] @ iteration:6 value1:0 	 value2:15
[39] @ iteration:7 value1:0 	 value2:15
[40] @ iteration:8 value1:0 	 value2:15
[41] @ iteration:9 value1:0 	 value2:15
[42] @ iteration:10 value1:0 	 value2:15
