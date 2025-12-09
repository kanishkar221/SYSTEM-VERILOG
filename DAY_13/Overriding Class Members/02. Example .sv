class parent_class;
  string place;
  int members;
  
  function new();
    place = "SALEM";
    members = 9;
  endfunction 
  
  function void display();
    $display("Place = %0s, Members = %0d",place, members);
  endfunction
endclass

class child1_class extends parent_class; // child_class_1
  string teams;
  int members;
  
  function new();
    teams = "RKS";
    members = 5;
  endfunction
  
  function void display();
    $display("Teams = %0s,Members = %0d",teams,members);
  endfunction
endclass

class child2_class extends parent_class; // child_class_2
  string teams;
  int members;
  
  function new();
    teams = "TEAM3";
    members = 3;
  endfunction
  
  function void display();
    $display("Teams = %0s,Members = %0d,Place = %0s",teams,members,place);
  endfunction
endclass

module example;
  child2_class c = new();
  initial begin
    $display("Before Over-riding");
    c.display();
    c.place = "KERALA";
    c.teams = "RKS";
    c.members = 5;
    $display("After Over-riding");
    c.display();
  end
endmodule

// OUTPUT
Before Over-riding
Teams = TEAM3,Members = 3,Place = SALEM
After Over-riding
Teams = RKS,Members = 5,Place = KERALA
