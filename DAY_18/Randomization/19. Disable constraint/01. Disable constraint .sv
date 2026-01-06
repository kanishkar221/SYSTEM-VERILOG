class packet;
  rand bit [3:0] data;
  constraint data_range {data inside {5,10,15};}
endclass

module constraint_mode;
  packet pkt = new();
  initial begin
    $display("If constraint mode is 1, it will display 5,10, or 15");
    $display("If constraint mode is 0, it will display random values");
    $display("Before constraint disable");
    $display("Value of constraint mode = %0d",pkt.data_range.constraint_mode());
    void'(pkt.randomize());
    $display("data = %0d",pkt.data);
    pkt.data_range.constraint_mode(0);
    $display("After Constraint Disable");
    $display("Value of constraint mode=%0d",pkt.data_range.constraint_mode());
    repeat(5) begin
      void'(pkt.randomize());
      $display("data = %0d",pkt.data);
    end
  end
endmodule

// OUTPUT
If constraint mode is 1, it will display 5,10, or 15
If constraint mode is 0, it will display random values
Before constraint disable
Value of constraint mode = 1
data = 15
After Constraint Disable
Value of constraint mode=0
data = 10
data = 15
data = 10
data = 14
data = 8
