10. Write a test bench to test string data type and its predefined methods by using the following statements
    a. declare a string data type and assign it to“SystemVerilog”
    b. use the getc() method to display the ASCII value of the first character of this string
    c. use toupper() method to display the string in capital letter
    d. concatenate the string with string “3.1a” and display
    e. replace the last character in the string with character ‘b’ using len() method and display
    f. use substr() method to display substring from 2nd to 5th character

// CODE

module datatype;
  string s1;
  string s2;
  string s3;
  int x;
  int n;

  initial begin
    // a. Display original string
    s1 = "SystemVerilog";
    $display("Original string = %s", s1);
    
    // b. ASCII value of 1st character using getc()
    x = s1.getc(0);
    $display("ASCII value of 1st character of s1: %0d", x);

    // c. Convert to uppercase
    s2 = s1.toupper();
    $display("Uppercase of s1: %s", s2);

    // d. Concatenate with "3.1a"
    s3 = {s1, "3.1a"};
    $display("Concatenate s1 with 3.1a: %s", s3);

    // e. Replace last character with 'b' using len()
    n = s1.len();
    s1.putc(n-1, "b");
    $display("s1 after replacing last char with 'b': %s", s1);

    // f. Substring from 2nd to 5th character
    $display("Substring from 2 to 5 = %s", s1.substr(1,4));
  end
endmodule

// OUTPUT

Original string = SystemVerilog
ASCII value of 1st character of s1: 83
Uppercase of s1: SYSTEMVERILOG
Concatenate s1 with 3.1a: SystemVerilog3.1a
s1 after replacing last char with 'b': SystemVerilob
Substring from 2 to 5 = yste
