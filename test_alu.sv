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
  initial begin

    opcode = 4'b0000;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("LL shift failed");
    #100;

    opcode = 4'b0001;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("LR shift failed");
    #100;

    opcode = 4'b0010;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("AR shift failed");
    #100;

    opcode = 4'b0010;
    a = 4'b1001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("AR shift failed");
    #100;

    opcode = 4'b0011;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b1110) $display("Ok, y is 4'b1110"); else $error("NOT failed");
    #100;

    opcode = 4'b0100;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b1110"); else $error("AND failed");
    #100;

    opcode = 4'b0101;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b1110"); else $error("OR failed");
    #100;

    opcode = 4'b0110;
    a = 4'b0001;
    b = 4'b0001;
    cin = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b1110"); else $error("XOR failed");
    #100;

  end

endmodule
