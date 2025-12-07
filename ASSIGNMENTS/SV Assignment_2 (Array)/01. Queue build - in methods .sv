1. Code for queue build-in methods size, insert (n/2 position, n position, n-1 p delete, pop_front, pop_back, push_front and push_back.

// CODE
module queue;
  int q [$];
  initial begin
    q = '{10,15,20,25,30,35,40};
    $display("Size of the Queue = %0d",q.size()); // Size
    
    q.insert((q.size()/2),22);
    $display("After insert n/2 position = %p",q); // insert n/2 position
    
    q.insert(q.size(),45);
    $display("After insert n position = %p",q);   // insert n
    
    q.delete((q.size()-1)-1);
    $display("After delete = %p",q);      // delete (n-1)-1 index
    
    q.pop_front();
    $display("After pop_front = %p",q);   // pop_front()
    
    q.pop_back();
    $display("After pop_back = %p",q);    // pop_back()
    
    q.push_front(5);
    $display("After push_front = %p",q);  // push_front()
    
    q.push_back(45);
    $display("After push_back = %p",q);   // push_back()
  end
endmodule

// OUTPUT
Size of the Queue = 7
After insert n/2 position = '{10, 15, 20, 22, 25, 30, 35, 40}
After insert n position = '{10, 15, 20, 22, 25, 30, 35, 40, 45}
After delete = '{10, 15, 20, 22, 25, 30, 35, 45}
After pop_front = '{15, 20, 22, 25, 30, 35, 45}
After pop_back = '{15, 20, 22, 25, 30, 35}
After push_front = '{5, 15, 20, 22, 25, 30, 35}
After push_back = '{5, 15, 20, 22, 25, 30, 35, 45}                                                 
                                                  
