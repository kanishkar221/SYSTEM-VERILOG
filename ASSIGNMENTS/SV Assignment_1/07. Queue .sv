7. Write a test bench to test queue data type and its predefined methods by using the following statements
	a. declare an int j and queue q of type int
	b. initialize int j as 1 and queue q as (0, 2, 5)
	c. insert int j at index 1 in queue q and display q
	d. delete index 1 element from queue q and display q
	e. push an element (7) in the front in queue q and display q
	f. push an element (9) at the back in queue q and display q
	g. pop an element from the back of queue q, display q, element
 	h. pop an element from front of queue q, display q, element
	i. reverse, sort, reverse sort, and shuffle the queue

// CODE 

module queue;
  int j;         // a.declare an int j 
  int q[$];      // a.declare queue q of type int
  initial begin
    // b. initialize int j as 1 and queue q as (0, 2, 5)
    j = 1;
    q = '{0,2,5};
    $display("q = %p",q);
    // c. insert int j at index 1 in queue q and display q
    q.insert(1,j);
    $display("After insert j at index 1 = %p",q);
    // d. delete index 1 element from queue q and display q
    q.delete(1);
    $display("After delete index 1 = %p",q);
    // e. push an element (7) in the front in queue q and display q
    q.push_front(7); 
    $display("After push front = %p",q);
    // f. push an element (9) at the back in queue q and display q
    q.push_back(9);
    $display("After push back = %p",q);
    // g. pop an element from the back of queue q, display q, element
    q.pop_back();
    $display("After pop back element = %p",q);
    // h. pop an element from front of queue q, display q, element
    q.pop_front();
    $display("After pop front element = %p",q);
    // i. reverse, sort, reverse sort, and shuffle the queue
    q.reverse();
    $display("After reverse = %p",q);
    q.sort();
    $display("After sort = %p",q);
    q.rsort();
    $display("After rsort = %p",q);
    q.shuffle();
    $display("After shuffle = %p",q);
  end
endmodule

// OUTPUT
	q = '{0, 2, 5}
	After insert j at index 1 = '{0, 1, 2, 5}
	After delete index 1 = '{0, 2, 5}
	After push front = '{7, 0, 2, 5}
	After push back = '{7, 0, 2, 5, 9}
	After pop back element = '{7, 0, 2, 5}
	After pop front element = '{0, 2, 5}
	After reverse = '{5, 2, 0}
	After sort = '{0, 2, 5}
	After rsort = '{5, 2, 0}
	After shuffle = '{0, 2, 5}
