// Class with non-static constraint
class class1;
  rand bit [2:0] value;
  constraint cons {value == 1;}  // Constraint : Forces value to always be 1
endclass

// Class with static constraint
class class2;
  rand bit [2:0] value;
  static constraint cons {value == 1;}  // Static constraint : applies to all instance of this class
endclass

module static_constraint();
  class1 object_1 = new();
  class1 object_2 = new();
  class1 object_3 = new();
  class1 object_4 = new();

initial begin
  // Disable constraint for object_1 (non-static constraint)
  object_1.cons.constraint_mode(0);
  $display("\t Non-Static Constraint turned off only in object 1");
  $display("\t Constraint : Value must be 1");
  // Randomize and display values for object_1 and object_2
  for (int i = 1; i <= 3; i++) begin  
    void'(object_1.randomize());  
    void'(object_2.randomize());  
    #1 $display("\t[%0t] @ iteration: %0d value in object_1: %0d  value in object_2: %0d",$time, i, object_1.value, object_2.value);  
  end 
  
  // Disable constraint for object_3 (static constraint)
  object_3.cons.constraint_mode(0); 
  $display("\t Static Constraint turned off only in object 3");
  $display("\t Constraint : Value must be 1");
  // Randomize and display values for object_3 and object_4
  for (int i = 1; i <= 3; i++) begin  
    void'(object_3.randomize());  
    void'(object_4.randomize());  
    #1 $display("\t[%0t] @ iteration: %0d value in object_3: %0d  value in object_4: %0d",$time, i, object_3.value, object_4.value);  
  end  
end
endmodule

// OUTPUT
Non-Static Constraint turned off only in object 1
Constraint : Value must be 1
[1] @ iteration: 1 value in object_1: 2  value in object_2: 1
[2] @ iteration: 2 value in object_1: 1  value in object_2: 1
[3] @ iteration: 3 value in object_1: 3  value in object_2: 1
Static Constraint turned off only in object 3
Constraint : Value must be 1
[4] @ iteration: 1 value in object_3: 1  value in object_4: 1
[5] @ iteration: 2 value in object_3: 1  value in object_4: 1
[6] @ iteration: 3 value in object_3: 3  value in object_4: 1
