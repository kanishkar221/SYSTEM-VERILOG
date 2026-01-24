// 04. Coverpoints using part select
module part_select();
  bit [2:0] a;
  
  covergroup cg;            // Declare covergroup
    a1: coverpoint a[1:0];  // Declare coverpoint a1 with 'a' has 2 bits from LSB
    a2: coverpoint a[0];    // Declare coverpoint a2 only with LSB
    a3: coverpoint a[2:1];  // Declare coverpoint a3 with 'a' has 2 bits from MSB
  endgroup
  
  cg cg_inst;               // Coverage cg instantiation
  
  initial begin
    cg_inst = new();
    for (int i=0; i<5; i++) begin
      a = $random;
      cg_inst.sample();     // sampling the covergroup
      $display("a=%d  a1=%b  a2=%b  a3=%b",a, a[1:0], a[0], a[2:1]);
      $display("\t coverage %%=%0.2f",cg_inst.get_coverage());
    end
  end
endmodule

// OUTPUT
a=4  a1=00  a2=0  a3=10
coverage %=33.33
a=1  a1=01  a2=1  a3=00
coverage %=66.67
a=1  a1=01  a2=1  a3=00
coverage %=66.67
a=3  a1=11  a2=1  a3=01
coverage %=83.33
a=5  a1=01  a2=1  a3=10
coverage %=83.33
