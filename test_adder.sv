module test_adder();

  logic signed [3:0] a;
  logic signed [3:0] b;
  logic signed [3:0] y;

  logic cin;
  logic cout;

  adder #(4) DUT(a, b, cin, y, cout);

  initial begin

    a = 4'b0000;
    b = 4'b0000;
    cin = 0;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    #100;

    a = 4'b0001;
    b = 4'b0000;
    cin = 0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    #100;

    a = 4'b0000;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    #100;

    a = 4'b0000;
    b = 4'b0000;
    cin = 1;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    #100;

    a = 4'b0101;
    b = 4'b0001;
    cin = 0;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0001"); else $error("sum or carry not correct");
    assert(cout === 0) $display("Ok, cout is 0"); else $error("sum or carry not correct");
    #100;

    a = 4'b0100;
    b = 4'b0110;
    cin = 1;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("sum or carry not correct");
    assert(cout === 1) $display("Ok, cout is 1"); else $error("sum or carry not correct");
    #100;

  end

endmodule
