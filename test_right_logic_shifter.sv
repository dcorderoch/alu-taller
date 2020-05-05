module test_right_logic_shifter();

  logic [3:0] a;
  logic [3:0] y;

  logic shift;

  right_logic_shifter #(4) DUT(a, shift, y);

  initial begin
    shift = 1;

    a = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0010"); else $error("4'b0000 failed");

    // 1 bit

    a = 4'b1000;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b1000 failed");

    a = 4'b0100;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b0100 failed");

    a = 4'b0010;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("4'b0010 failed");

    a = 4'b0001;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0001 failed");

    // 2 bits (contiguous)

    a = 4'b1100;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0011"); else $error("4'b0110 failed");

    a = 4'b0110;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("4'b0110 failed");

    a = 4'b0011;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("4'b0011 failed");

    a = 4'b1001;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b1001 failed");

    // w bits (non-contiguous)

    a = 4'b1010;
    #100;
    assert(y === 4'b0101) $display("Ok, y is 4'0101"); else $error("4'b1010 failed");

    a = 4'b0101;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b0101 failed");

    // 3 bits (contiguous)

    a = 4'b1110;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("4'b0111 failed");

    // 3 bits (non-contiguous)

    a = 4'b1101;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("4'b1101 failed");

    a = 4'b1011;
    #100;
    assert(y === 4'b0101) $display("Ok, y is 4'b0101"); else $error("4'b1011 failed");

    // 4 bits

    a = 4'b1111;
    #100;
    assert(y === 4'b0111) $display("Ok, y is 4'b0111"); else $error("4'b1111 failed");

    shift = 2

    a = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0010"); else $error("4'b0000 failed");

    // 1 bit

    a = 4'b1000;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b1000 failed");

    a = 4'b0100;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("4'b0100 failed");

    a = 4'b0010;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0010 failed");

    a = 4'b0001;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0001 failed");

    // 2 bits (contiguous)

    a = 4'b1100;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("4'b1100 failed");

    a = 4'b0110;
    #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("4'b0110 failed");

    a = 4'b0011;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0011 failed");

    a = 4'b1001;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b1001 failed");

    // 2 bits (non-contiguous)

    a = 4'b1010;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b1010 failed");

    a = 4'b0101;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b0101 failed");

    // 3 bits (contiguous)

    a = 4'b1110;
    assert(y === 4'b0001) $display("Ok, y is 4'b0001"); else $error("4'b1110 failed");

    // 3 bits (non-contiguous)

    a = 4'b1101;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("4'b1101 failed");

    a = 4'b1011;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b1011 failed");

    // 4 bits

    a = 4'b1111;
    #100;
    assert(y === 4'b0011) $display("Ok, y is 4'b0011"); else $error("4'b1111 failed");

  end

endmodule
