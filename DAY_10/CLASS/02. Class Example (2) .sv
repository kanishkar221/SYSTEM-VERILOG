// CODE 
class home;
   bit light;    
   int fan;
   string switch;

   task open_electricity();
     switch = "ON";
     $display("Switch is %s, so electricity is open", switch);
   endtask
endclass

// TESTBENCH

module check_electricity;
  initial begin
    home h1;
    h1 = new();
    h1.light = 1;
    h1.fan = 1;
    h1.open_electricity;
    $display("Light is on = %0d",h1.light);
    $display("Fan is on = %0d",h1.fan);
  end
endmodule

// OUTPUT 
Switch is ON, so electricity is open
Light is on = 1
Fan is on = 1
