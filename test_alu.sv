module test_alu();

  logic [3:0] opcode;

  logic [3:0] a;
  logic [3:0] b;

  logic [3:0] cin;

  logic [3:0] y;

  logic [3:0] cout;
  logic [3:0] overflow;
  logic [3:0] negative;
  logic [3:0] zero;

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
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("shift failed");
    #100;

  end

endmodule
