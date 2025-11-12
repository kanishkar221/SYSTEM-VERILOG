module tb;
  bit[2:0][1:0][7:0]m_data;
  initial begin
    m_data[0]=16'h0702;
    m_data[1]=16'h0804;
    m_data[2]=16'h0906;
    
    $display("m_data=0x%h",m_data);
    m_data=48'hcafe_dfae_0102;
    $display("m_data=0x%h",m_data);
    
    foreach(m_data[i])begin
      $display("m_data(%0d)=0x%h",i,m_data[i]);
      foreach(m_data[i][j])begin
        $display("data[280][204]=0x%h",i,j,m_data[i][j]);
      end
    end
  end
endmodule
        
                 
