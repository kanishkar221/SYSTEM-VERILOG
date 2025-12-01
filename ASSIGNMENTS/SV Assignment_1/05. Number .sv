// 5. Predict the output for the below code

module top;
  int num1;
  int num2;
  initial begin
    num1 = int '(10.0 - 1.8);
    $display("Integer value is : %d",num1);
    num2 = int '(5/3);
    $display("Integer value is : %d",num2);
  end
endmodule


OUTPUT
	Integer value is : 8
	Integer value is : 1
	
