6.Write a test bench to test the dynamic array data type and its predefined methods by using the following statements
	a. declare two dynamic arrays d1, d of type int
	b. initialize d array elements with (9,1,8,3,4,4)
	c. allocate six elements in array d1
	d. initialize array d1 with index as its value
	e. display d1 and its size
	f. delete array d1
	g. reverse, sort, reverse sort, and shuffle the array d

// CODE

module dynamic_array;
  int d [];
  int d1 [];
  initial begin
    d = new[6];
    // b. initialize d array elements with (9,1,8,3,4,4)
    d = '{9,1,8,3,4,4};
    // c. allocate six elements in array d1
    d1 = new[6];
    // d. initialize array d1 with index as its value
    foreach (d1[i])
      d1[i] = i;
    // e. display d1 and its size
    $display("d1 = %p",d1);
    $display("Size of d1 = %0d ",d1.size());
    // f. delete array d1
    d1.delete();
    $display("d1 after delete = %p",d1);
    // g. reverse, sort, reverse sort, and shuffle the array d
    $display("d = %p",d);
    d.reverse();
    $display("After reverse = %p",d);
    d.sort();
    $display("After sort = %p",d);
    d.rsort();
    $display("After rsort = %p",d);
    d.shuffle();
    $display("After shuffle = %p",d);  
  end
endmodule

// OUTPUT

	d1 = '{0, 1, 2, 3, 4, 5}
	Size of d1 = 6 
	d1 after delete = '{}
	d = '{9, 1, 8, 3, 4, 4}
	After reverse = '{4, 4, 3, 8, 1, 9}
	After sort = '{1, 3, 4, 4, 8, 9}
	After rsort = '{9, 8, 4, 4, 3, 1}
	After shuffle = '{3, 8, 9, 1, 4, 4}
  
