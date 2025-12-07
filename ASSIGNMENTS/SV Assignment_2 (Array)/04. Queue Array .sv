4. write a code for queue array with 4 elements ... insert 1in the 1st index.. delete element in 3rd index... 
   insert 9 as the last element... shuffle, reverse the elements

// CODE
module queue;
  int q[$] = '{1,2,3,4};
  initial begin
    $display("Array = %p",q);
    q.insert(1,1);   // insert 1 in 1 st index
    $display("After insert 1 in 1st position = %p",q);
    
    q.delete(3);     // delete 3 rd position
    $display("After delete in 3 rd position = %p",q);
    
    q.push_back(9);  // insert 9 in last element
    $display("After insert 9 in last position = %p",q);
    
    q.shuffle;       // shuffle
    $display("After Shuffle = %p",q);
    
    q.reverse;       // reverse
    $display("After Reverse = %p",q);
  end
endmodule

// OUTPUT
Array = '{1, 2, 3, 4}
After insert 1 in 1st position = '{1, 1, 2, 3, 4}
After delete in 3 rd position = '{1, 1, 2, 4}
After insert 9 in last position = '{1, 1, 2, 4, 9}
After Shuffle = '{9, 1, 1, 2, 4}
After Reverse = '{4, 2, 1, 1, 9}

