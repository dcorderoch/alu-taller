module test_alu();

  logic [3:0] opcode;

  logic [3:0] a;
  logic [3:0] b;

  logic cin;

  logic [3:0] y;

  logic cout;
  logic overflow;
  logic negative;
  logic zero;

  alu #(4) DUT(opcode,
           a,
           b,
           cin,
           y,
           cout,
           overflow,
           negative,
           zero
          );
  import alu_ops::*;

  initial begin

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("LL shift failed");
    #100;

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0010;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("LL shift failed");
    #100;

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b0010;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("LL shift failed");
    #100;

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b1000;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("LL shift failed");
    #100;

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0011;
    cin = 1'b0;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("LL shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::LL_SHIFT_OP;
    a = 4'b0101;
    b = 4'b0001;
    cin = 1'b000;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("LL shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    // end Logical Left Shift Operations

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b1000;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b0011;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b0100;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b1001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b1011;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0101) $display("Ok, y is 4'b0101"); else $error("LR shift failed");
    #100;

    // end Logical Right Shift Operations

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("AL shift failed");
    #100;

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0010;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("AL shift failed");
    #100;

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b0010;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("AL shift failed");
    #100;

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b1000;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("AL shift failed");
    #100;

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0011;
    cin = 1'b0;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("AL shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AL_SHIFT_OP;
    a = 4'b0101;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("AL shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    // end Arithmetic Left Shift Operations

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("AR shift failed");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b1001;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("AR shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b1111;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("AR shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b1101;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1110) $display("Ok, y is 4'b1110"); else $error("AR shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b1110;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("AR shift failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b0011;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("AR shift failed");
    #100;

    // end Arithmetic Right Shift Operations

    opcode = alu_ops::NOT_OP;
    a = 4'b1000;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b0111) $display("Ok, y is 4'b1000"); else $error("NOT failed");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b1010;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b0101) $display("Ok, y is 4'b0101"); else $error("NOT failed");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b0101;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("NOT failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b0011;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("NOT failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b1100;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("NOT failed");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b0001;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b1110) $display("Ok, y is 4'b0001"); else $error("NOT failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    // end NOT Operations

    opcode = alu_ops::AND_OP;
    a = 4'b1111;
    b = 4'b0111;
    cin = 1'b0;
    #100;
    assert(y === 4'b0111) $display("Ok, y is 4'b0111"); else $error("AND failed");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b1010;
    b = 4'b0111;
    cin = 1'b0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("AND failed");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b1111;
    b = 4'b0101;
    cin = 1'b0;
    #100;
    assert(y === 4'b0101) $display("Ok, y is 4'b0101"); else $error("AND failed");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b1111;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("AND failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b0101;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("AND failed");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b1111;
    b = 4'b1111;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("AND failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    // end AND Operations

    opcode = alu_ops::OR_OP;
    a = 4'b1110;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("OR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b1010;
    b = 4'b0101;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("OR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b0010;
    b = 4'b0001;
    cin = 1'b0;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("OR failed");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b1000;
    b = 4'b0100;
    cin = 1'b0;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("OR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b1111;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("OR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b0000;
    b = 4'b1111;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("OR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    // end OR Operations

    opcode = alu_ops::XOR_OP;
    a = 4'b1010;
    b = 4'b0101;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("XOR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b1100;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("XOR failed");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b0011;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b1001) $display("Ok, y is 4'b1001"); else $error("XOR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b0101;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("XOR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b1111;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("XOR failed");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b1010;
    b = 4'b1010;
    cin = 1'b0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("XOR failed");
    #100;

    // end XOR operations

    opcode = alu_ops::SUB_OP;
    a = 4'b0001;
    b = 4'b0000;
    cin = 1'b0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::SUB_OP;
    a = 4'b0011;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::SUB_OP;
    a = 4'b0101;
    b = 4'b0010;
    cin = 0;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::SUB_OP;
    a = 4'b1000;
    b = 4'b0011;
    cin = 1;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 1) $display("Ok, overflow is 1"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::SUB_OP;
    a = 4'b1011;
    b = 4'b0111;
    cin = 0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 1) $display("Ok, overflow is 1"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::SUB_OP;
    a = 4'b1111;
    b = 4'b1000;
    cin = 1;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    // end SUB operations

    opcode = alu_ops::ADD_OP;
    a = 4'b0000;
    b = 4'b0000;
    cin = 0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b0001;
    b = 4'b0000;
    cin = 0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b0000;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b1000;
    b = 4'b0111;
    cin = 1;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("sum or carry not correct");
    assert(cout === 1) $display("Ok, cout is 1"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b0101;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b0100;
    b = 4'b0110;
    cin = 1;
    #100;
    assert(y === 4'b1011) $display("Ok, y is 4'b1011"); else $error("sum or carry not correct");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 1) $display("Ok, overflow is 1"); else $error("sum or carry not correct");
    #100;

    opcode = alu_ops::ADD_OP;
    a = 4'b1111;
    b = 4'b1111;
    cin = 1;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("sum or carry not correct");
    assert(negative === 1) $display("Ok, negative is 1"); else $error("negative flag didn't get set");
    assert(cout === 1) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    assert(overflow === 0) $display("Ok, overflow is 0"); else $error("sub or carry not correct");
    #100;

    // end ADD operations

  end

endmodule
