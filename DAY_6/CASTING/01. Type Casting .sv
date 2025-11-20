module type_casting;
  string name;
  int num[3];
  real r_num;
  initial begin
    name="C";
    r_num=2.5;
    num[0]=int'(name);//Take ASCII value for string
    num[1]=int'(r_num);
    r_num=2+real'({4'h1,4'hC});
    num[2]=int'((num[0]==65)?r_num:4.7);
    $display("String to int casting:num[0]=%0d",num[0]);            //67
    $display("Real to int casting:num[1]=%0d",num[1]);              //3
    $display("Int to real casting:r_num=%0f",r_num);                //30.00
    $display("Expression Real to int casting:num[2]=%0d",num[2]);   //5
  end
endmodule

OUTPUT
    String to int casting:num[0]=67
    Real to int casting:num[1]=3
    Int to real casting:r_num=30.000000
    Expression Real to int casting:num[2]=5
    
