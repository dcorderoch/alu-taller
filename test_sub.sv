module test_sub();

  logic [3:0] a;
  logic [3:0] b;
  logic [3:0] y;

  logic cin;
  logic cout;

  sub #(4) DUT(a, b, cin, y, cout);

  initial begin

    a = 4'b0001;
    b = 4'b0000;
    cin = 0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

    a = 4'b0011;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

    a = 4'b0101;
    b = 4'b0010;
    cin = 0;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

    a = 4'b1000;
    b = 4'b0011;
    cin = 1;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

    a = 4'b1011;
    b = 4'b0111;
    cin = 0;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

    a = 4'b1111;
    b = 4'b1000;
    cin = 1;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("sub or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sub or carry not correct");
    #100;

  end

endmodule
