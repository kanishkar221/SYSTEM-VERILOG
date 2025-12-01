// 2. Write a snippet in SV to insert one queue into another queue. (Do it with & without using array methods)

module queue;  // without using array
  int q1[$] = '{2,4,6,8};
  int q2[$] = '{1,3,5,7};
  initial begin
    $display(q1);
    $display(q2);
    foreach (q2[i])begin    //insert q2 into q1 manually
      q1.push_back(q2[i]);
  end
   $display("q1 after inserting q2", q1);
   end
endmodule
  
=====================================================

module queue;   // with using array
  int q1[$] = '{2,4,6,8};
  int q2[$] = '{1,3,5,7};
  initial begin
    $display(q1);
    $display(q2);
    q1 = {q1,q2};  // concatenation
    $display("q1 after inserting q2",q1);  // insert q2 into q1 using concatenation
  end
endmodule
    

OUTPUT 
	'{2, 4, 6, 8}
	'{1, 3, 5, 7}
	q1 after inserting q2'{2, 4, 6, 8, 1, 3, 5, 7}
