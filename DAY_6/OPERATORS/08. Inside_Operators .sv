module operator;
  bit[3:0] bus_data;
  initial begin
    for(int i=0;i<4;i++)
      begin
        bus_data =$urandom;
        if(bus_data inside {1,2,[5:8],10})
          $display("bus_data=%0d 'inside' {1,2,[5:8],10}",bus_data);
        else
          $display("bus_data=%0d 'outside' {1,2,[5:8],10}",bus_data);
      end
  end
endmodule
