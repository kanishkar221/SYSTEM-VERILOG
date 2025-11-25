module dynamic_array;
  string a[];
  initial begin
    $display("Size of a is %0d",a.size());
    a = new[5];
    a = {"Mango","Apple","Watermelon","Orange","Amla"};
    $display("a = %0p",a);
    a = new[15](a);
    $display("a = %0p",a);
    $display("Size of a is %0d",a.size());
    a.delete();
    $display("Size of a is %0d",a.size());
  end
endmodule
 
