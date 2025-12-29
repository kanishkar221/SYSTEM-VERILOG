class parent;
  rand byte a;
  rand byte b;
  constraint cons {a==0;b==5;}
endclass

class child extends parent;
  constraint cons {a==5;b==8;}
endclass

module top;
  initial begin
    child t1;
    t1 = new;
    for (int i=0;i<3;i++)
      begin
        if(!t1.randomize()) begin
          $display("Randomization Failed");
        end
        else begin
          $display("Iteration = %0d Value of a = %0d Value of b = %0d",i,t1.a,t1.b);
          $display("-------------------------------------------------");
        end
      end
  end
endmodule

// OUTPUT
Iteration = 0 Value of a = 5 Value of b = 8
-------------------------------------------------
Iteration = 1 Value of a = 5 Value of b = 8
-------------------------------------------------
Iteration = 2 Value of a = 5 Value of b = 8
-------------------------------------------------
