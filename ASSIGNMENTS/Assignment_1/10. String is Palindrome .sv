module palindrome_check;
  string s;
  string rev_s;
  initial begin
    s = "racecar";
    $display("Before the reverse = %s", s);
    for (int i = s.len() - 1; i >= 0; i--)
      rev_s = {rev_s, s[i]};
    $display("After the reverse = %s", rev_s);
    if (s == rev_s)
      $display("String is a palindrome = %s", s);
    else
      $display("String is not a palindrome = %s", s);
  end
endmodule
