module queue;
  int q[$] = '{2,3,4,5};
  initial begin
    $display("Size of the queue", q.size());
    q.insert(0,1);
    $display("After insert", q);
    q.delete(2);
    $display("After delete", q);
    q.push_back(9);
    $display("After push_back", q);
    q.shuffle();
    $display("After shuffle", q);
    q.reverse();
    $display("After reverse", q);
  end
endmodule
