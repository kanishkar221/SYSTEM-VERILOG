class A;
  string country;
  string place;
  mailbox #(string) m;
  
  function new(mailbox #(string) m1);
    this.m = m1;
  endfunction
  
  task trans_data();
    country = "India";
    place = "Salem";
    m.put(country);
    m.put(place);
    $display("Transmitter:Country = %0s,visit place = %0s",country,place);
    endtask
endclass

class B;
  string country;
  string place;
  mailbox #(string) m;
  function new(mailbox #(string) m2);
    this.m = m2;
  endfunction
  
  task recei_data();
    m.get(country);
    m.get(place);
    $display("Receiver:Country = %0s,visit place = %0s",country, place);
  endtask
endclass

module tb();
  A a1;
  B b1;
  int i;
  mailbox #(string) main = new(6);
  initial begin
    a1 = new(main);
    b1 = new(main);
    a1.trans_data();
    $display("----------------------------------------------------------");
    b1.recei_data();
  end
endmodule

// OUTPUT
Transmitter:Country = India,visit place = Salem
----------------------------------------------------------
Receiver:Country = India,visit place = Salem

