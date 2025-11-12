module tb;
  bit [3:0][7:0] m_data;
  initial begin
    m_data=32'h01020304;
    $display("m_data=%0h",m_data);
    for(int i=0;i<4;i++)begin
      $display("data[%0d] = %0h",i,m_data[i]);
      end
  end
endmodule
