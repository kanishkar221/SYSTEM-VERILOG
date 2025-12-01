// 1. Sort the contents of a dynamic array which contains 10 elements in it.

module dynamic_array;
  int arr[];
  initial begin
    arr = new[10];
    arr = '{18,2,22,10,9,25,45,38,99,67};
    foreach (arr[i])
      $display("array[%0d] = %0d",i,arr[i]);
    arr.sort();
    $display("After sorting:");
    foreach (arr[i])
      $display("array[%0d] = %0d",i,arr[i]);
  end
endmodule

// OUTPUT 
	array[0] = 18
	array[1] = 2
	array[2] = 22
	array[3] = 10
	array[4] = 9
	array[5] = 25
	array[6] = 45
	array[7] = 38
	array[8] = 99
	array[9] = 67
	After sorting:
	array[0] = 2
	array[1] = 9
	array[2] = 10
	array[3] = 18
	array[4] = 22
	array[5] = 25
	array[6] = 38
	array[7] = 45
	array[8] = 67
	array[9] = 99
