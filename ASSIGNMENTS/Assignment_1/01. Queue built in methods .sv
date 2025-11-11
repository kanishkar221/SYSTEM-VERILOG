module queue;
  int q[$] = '{1,2,3,4,5,6};
  initial begin
    $display("Size of the queue = %0d", q.size());
    q.insert((q.size()/2)-1, 8);
    $display("After insert at n/2 position: %p", q);
    q.insert(q.size()-1, 7);
    $display("After insert at n position: %p", q);
    q.insert((q.size()-2), 9);
    $display("After insert at n-1 position: %p", q);
    q.delete(q.size()-2);
    $display("After delete at n-1 position: %p", q);
    q.pop_front();
    $display("After pop_front: %p", q);
    q.pop_back();
    $display("After pop_back: %p", q);
    q.push_front(2);
    $display("After push_front: %p", q);
    q.push_back(6);
    $display("After push_back: %p", q);
    $display("Final Size of the queue = %0d", q.size());
  end
endmodule

