module union_example;
  typedef union packed {
    logic[15:0]word;
    struct packed {
      logic[7:0]byte1;
      logic[7:0]byte2;
    }bytes;
  }word_t;
  word_t my_word;
  
  initial begin
    my_word.word = 16'hA5A5;   //A5=1010_0101
    $display("Byte1:%b,Byte2:%h",my_word.bytes.byte1,my_word.bytes.byte2);
  end
endmodule
  
