//Write a constraint for a 32-bit variable such that exactly 12 non-consecutive 1's are generated.

class nonconsecutive_12_ones;
  rand bit [31:0] data;

  constraint non_consecutive_c {
    $countones(data) == 12;    // Exactly 12 ones
	foreach (data[i])          // No two consecutive ones
      if (i < 31)
        (data[i] + data[i+1]) <= 1;
  }

  function void display();
    $display("Data = %032b  || ones = %0d", data, $countones(data));
  endfunction
endclass

module tb;
  nonconsecutive_12_ones obj;

  initial begin
    obj = new();
    repeat (15) begin
      if (!obj.randomize())
        $display("Randomization failed!");
      else
        obj.display();
    end
    $finish;
  end
endmodule

