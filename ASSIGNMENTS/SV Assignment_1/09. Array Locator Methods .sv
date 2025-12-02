9. Write a test bench to test predefined array locator methods by using the following statements
	a. declare queues q, tq, dynamic array d, fixed array f
	b. initialize q to (1,3,5,7), d to (9,1,8,3,4,4), f to (1,6,2,6,8,6)	
	c. display sum, product of elements of array q
	d. display min, max values stored in array q
	e. display the unique elements from array f
	f. find elements in array d with condition item > 3
	g. find indexes of those elements in array d which have condition item > 3
	h. find indexes of those elements in array d which have condition item > 99
	i. find the first index in array d which matches with condition item==8
	j. find the last element in array d which matches with condition item==4
	k. find the last index in array d which matches with condition item==4
	l. find the sum of elements in array d with condition item > 7
	m. find the sum of elements in array d with condition ((item > 7) * item)
	n. find the sum of elements in array d with condition item < 8
	o. find the sum of elements in array d with condition ((item < 8)? item:0)

// CODE

module array;
  int q[$]='{1,3,5,7};
  int tq[$];
  int d[] = {9,1,8,3,4,4};
  int f[6] = {1,6,2,6,8,6};
  int count;
  initial begin
   // c. display sum, product of elements of array q
    $display(q.sum());
    $display(q.product());
   //d. display min, max values stored in array q
    $display(q.min());
    $display(q.max());
    //e. display the unique elements from array f
    $display(f.unique());
    //f. find elements in array d with condition item > 3
    tq = d.find with(item>3);
    $display(tq);
    //g. find indexes of those elements in array d which have condition item > 3
    tq = d.find_index with (item>3);
    $display(tq);
    //h. find indexes of those elements in array d which have condition item > 99
    tq = d.find_index with (item>99);
    $display(tq);
    //i. find the first index in array d which matches with condition item==8
    tq = d.find_index with (item==8);
    $display(tq);
    //j. find the last element in array d which matches with condition item==4
    tq = d.find_last with(item==4);
    $display(tq);
    //k. find the last index in array d which matches with condition item==4
    tq = d.find_last_index with (item==4); 
    $display(tq);
    //l. find the sum of elements in array d with condition item > 7
    count = d.sum();
    $display(count);
    //m. find the sum of elements in array d with condition ((item > 7) * item)
    count = d.sum with((item > 7) * item); 
    $display(count);
    //n. find the sum of elements in array d with condition item < 8
    count = d.sum with(item < 8);
    $display(count);
    //o. find the sum of elements in array d with condition ((item < 8)? item:0)
    count = d.sum with((item < 8)? item:0);
    $display(count);
  end
endmodule

// OUTPUT 




