class std_random_class;
  int a;
  rand bit [2:0] b;
  constraint c1 {a >= 2;a <= 9;}
  function void display();
    int c;
    // Randomize all class variable using std::randomize (this). This will randomize 'a' and 'b'
    void'(std::randomize(this));
    $display("Using std::randomize(this) a=%0d,b=%0d",a,b);
    
    // Randomize only variable 'a' using class randomize, works even though 'a' is not declared as rand
    if(randomize(a))
      $display("Using randomize(a) a=%0d",a);
    
	// Randomize variable 'a' using std::randomize
    if(std::randomize(a))
      $display("Using std::randomize(a) a=%0d",a);
    
    // Randomize variable 'b' using std::randomize
    if(std::randomize(b))
      $display("Using std::randomize(b) b=%0d",b);
    
	// Randomize local variable 'c' with inline constraint
    if(std::randomize(c)with {c > 1;c < 4;})
      $display("Using std::randomize(c) with constraint c=%0d",c);

    // void'(this.randomize());
    $display ("This randomize a=%0d b=%0d c=%0d",a,b,c);
    $display("------------------------------");
  endfunction
endclass

module tb;
  std_random_class t;
  initial begin     // class handle
    t=new();        // create object
    repeat(3)       // call display function 3 times
      t.display();
  end
endmodule

// OUTPUT
Using std::randomize(this) a=0,b=2
Using randomize(a) a=6
Using std::randomize(a) a=-323839875
Using std::randomize(b) b=2
Using std::randomize(c) with constraint c=2
This randomize a=-323839875 b=2 c=2
------------------------------
Using std::randomize(this) a=-323839875,b=1
Using randomize(a) a=4
Using std::randomize(a) a=-1621255588
Using std::randomize(b) b=0
Using std::randomize(c) with constraint c=2
This randomize a=-1621255588 b=0 c=2
------------------------------
Using std::randomize(this) a=-1621255588,b=2
Using randomize(a) a=8
Using std::randomize(a) a=-771459350
Using std::randomize(b) b=2
Using std::randomize(c) with constraint c=3
This randomize a=-771459350 b=2 c=3
------------------------------
