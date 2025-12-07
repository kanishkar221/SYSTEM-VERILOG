3. write a code for dynamic array... give the value of array using foreach.. display the size.. shuffle the array elements...

// CODE
module dynamic_array;
  int arr[];
  initial begin
    arr = new [5];
    foreach(arr[i]) begin
      arr[i] = (i+1)*10;
    end

    $display("Size of the array = %0d",arr.size());
    $display("Array before Shuffle = %p",arr);
    arr.shuffle();
    $display("After after Shuffle = %p",arr);
  end
endmodule

// OUTPUT
Size of the array = 5
Array before Shuffle = '{10, 20, 30, 40, 50}
After after Shuffle = '{50, 20, 10, 30, 40}
