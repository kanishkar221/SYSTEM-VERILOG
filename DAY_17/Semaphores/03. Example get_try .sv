module semaphore_exa_get_try;
  semaphore car_key = new(1);
  initial begin
    fork
      begin
        $display("Person A waiting for car,time = %0t",$time);
        car_key.get(1);
        $display("Person A got the car,time = %0t",$time);
        #10;
        car_key.put(1);
        $display("Person A returning back car,time = %0t",$time);
      end
      
      begin
        #1;
        $display("Person B waiting for car,time = %0t",$time);
        void'(car_key.try_get(1));
        $display("Person B got the car,time = %0t",$time);
        #10;
        car_key.put(1);
        $display("Person B returning back car,time = %0t",$time);
      end
    join
  end
endmodule

// OUTPUT
Person A waiting for car,time = 0
Person A got the car,time = 0
Person B waiting for car,time = 1
Person B got the car,time = 1
Person A returning back car,time = 10
Person B returning back car,time = 11
