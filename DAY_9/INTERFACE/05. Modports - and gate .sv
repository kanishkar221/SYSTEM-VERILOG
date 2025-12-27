// Design
module and_gate(and_intr inf);
  // assign the output using continuous assignment 
  assign inf.DUT_MP.r = (inf.DUT_MP.p) & (inf.DUT_MP.q);
endmodule

// Interface
interface and_intr;    
  logic p,q;  
  logic r;  
  modport DUT_MP(input p,input q,output r);
  modport TB_MP(output p,output q,input r);  
endinterface

// Top Module 
module top();
  and_intr inf();    // interface module caled
  and_gate a1(inf);  // Design module called
  tb a2(inf);        // Testbench module called
endmodule

// Testbench
module tb(and_intr inf);
  initial begin
    $display("// and gate output using modports\n");
    repeat(5) begin
      inf.TB_MP.p = $random;
      #1;
      inf.TB_MP.q = $random;
      #1;
      $display("input_p=%b\t input_q=%b\t output_r=%b",inf.TB_MP.p,inf.TB_MP.q,inf.TB_MP.r);
    end
  end
endmodule

// OUTPUT

// and gate output using modports
input_p=0	 input_q=1	 output_r=0
input_p=1	 input_q=1	 output_r=1
input_p=1	 input_q=1	 output_r=1
input_p=1	 input_q=0	 output_r=0
input_p=1	 input_q=1	 output_r=1
