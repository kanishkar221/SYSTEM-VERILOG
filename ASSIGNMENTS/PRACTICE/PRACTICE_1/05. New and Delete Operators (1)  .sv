module new_del;
  int d[];
  initial begin
    d = new[5];   //Size allocated is 6
    d = '{18,2,22,10,9};    //Array initialize
    $display("Size is %0d ",d.size());
    d.delete();
    $display("Size is %0d ",d.size());
  end
endmodule

====================//============================

module operators;
  class Packet;
    logic[7:0]addr;
    logic[15:0]data;
    function new();
    	//empty       
    endfunction
  endclass
  
  Packet pkt=new();
  
  initial begin
    pkt.addr = 8'hA5;
    pkt.data = 16'hFFFF;
    
    #20;
    
    pkt=null;
    if (pkt==null)
      $display("Packet deleted and handle is null");
    else
      $display("Packet NOT deleted");
  end
endmodule

