class base_class;           // Using without this keyword
  string fan = "OFF";
  string switch = "OFF";
  
  function void open_electricity();
    string fan = "ON";
    string switch = "ON";
    fan = fan;
    switch = switch;
    $display("Inside class: Switch is %s ,so fan is %s",switch,fan);
  endfunction
endclass

module check_electricity;
  base_class b1;
  initial begin
    b1 = new();
    b1.open_electricity;
    $display("Outside class: Switch is %s ,so fan is %s",b1.switch,b1.fan);
  end
endmodule

// OUTPUT
	Inside class: Switch is ON ,so fan is ON
	Outside class: Switch is OFF ,so fan is OFF
	
