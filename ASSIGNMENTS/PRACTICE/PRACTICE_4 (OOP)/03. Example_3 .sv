class world_cup_19;
  bit [15:0] premium_ticket;
  function league_match();
    $display("Premium Ticket Rate = %0d",premium_ticket);
  endfunction
endclass

class world_cup_23 extends world_cup_19;
  bit [15:0] golden_ticket;
  function semi_final();
    $display("Golden Ticket Rate = %0d",golden_ticket);
  endfunction
endclass

module example;
  world_cup_23 wc = new();
  initial begin
    wc.premium_ticket = 10000;
    wc.golden_ticket = 5000;
    wc.league_match();
    wc.semi_final();
  end
endmodule

// OUTPUT 
Premium Ticket Rate = 10000
Golden Ticket Rate = 5000
