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
    cin = 4'b0000;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("LL shift failed");
    #100;

    opcode = alu_ops::LR_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("LR shift failed");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("AR shift failed");
    #100;

    opcode = alu_ops::AR_SHIFT_OP;
    a = 4'b1001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("AR shift failed");
    #100;

    opcode = alu_ops::NOT_OP;
    a = 4'b1000;
    b = 4'b0000;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0111) $display("Ok, y is 4'b1000"); else $error("NOT failed");
    #100;

    opcode = alu_ops::AND_OP;
    a = 4'b1111;
    b = 4'b0111;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0111) $display("Ok, y is 4'b0111"); else $error("AND failed");
    #100;

    opcode = alu_ops::OR_OP;
    a = 4'b1010;
    b = 4'b0101;
    cin = 4'b0000;
    #100;
    assert(y === 4'b1111) $display("Ok, y is 4'b1111"); else $error("OR failed");
    #100;

    opcode = alu_ops::XOR_OP;
    a = 4'b1100;
    b = 4'b1010;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("XOR failed");
    #100;

  end

endmodule
