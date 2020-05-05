module test_left_logic_shifter();

  logic [3:0] a;
  logic [3:0] y;

  logic [3:0] shift;

  left_logic_shifter #(4) DUT(a, shift, y);

  initial begin
    shift = 1;

    a = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0000 failed");
    #100;

    // 1 bit

    a = 4'b1000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b1000 failed");
    #100;

    a = 4'b0100;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b0100 failed");
    #100;

    a = 4'b0010;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b0010 failed");
    #100;

    a = 4'b0001;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b0001 failed");
    #100;

    // 2 bits (contiguous)

    a = 4'b1100;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b1100 failed");
    #100;

    a = 4'b0110;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("4'b0110 failed");
    #100;

    a = 4'b0011;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("4'b0011 failed");
    #100;

    a = 4'b1001;
    #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b0010"); else $error("4'b1001 failed");
    #100;

    // w bits (non-contiguous)

    a = 4'b1010;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b1010 failed");
    #100;

    a = 4'b0101;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("4'b0101 failed");
    #100;

    // 3 bits (contiguous)

    a = 4'b1110;
	  #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("4'b1110 failed");
	  #100;

    // 3 bits (non-contiguous)

    a = 4'b1101;
    #100;
    assert(y === 4'b1010) $display("Ok, y is 4'b1010"); else $error("4'b1101 failed");
    #100;

    a = 4'b1011;
    #100;
    assert(y === 4'b0110) $display("Ok, y is 4'b0110"); else $error("4'b1011 failed");
    #100;

    // 4 bits

    a = 4'b1111;
    #100;
    assert(y === 4'b1110) $display("Ok, y is 4'b1110"); else $error("4'b1111 failed");
    #100;

    shift = 2;

	  a = 4'b0000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0000 failed");
    #100;

    // 1 bit

    a = 4'b1000;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b1000 failed");
    #100;

    a = 4'b0100;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b0100 failed");
    #100;

    a = 4'b0010;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b0010 failed");
    #100;

    a = 4'b0001;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b0001 failed");
    #100;

    // 2 bits (contiguous)

    a = 4'b1100;
    #100;
    assert(y === 4'b0000) $display("Ok, y is 4'b0000"); else $error("4'b1100 failed");
    #100;

    a = 4'b0110;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b0110 failed");
    #100;

    a = 4'b0011;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("4'b0011 failed");
    #100;

    a = 4'b1001;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b1001 failed");
    #100;

    // 2 bits (non-contiguous)

    a = 4'b1010;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b1010 failed");
    #100;

    a = 4'b0101;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b0101 failed");
    #100;

    // 3 bits (contiguous)

    a = 4'b1110;
    #100;
    assert(y === 4'b1000) $display("Ok, y is 4'b1000"); else $error("4'b1110 failed");
    #100;
    // 3 bits (non-contiguous)

    a = 4'b1101;
    #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0100"); else $error("4'b1101 failed");
    #100;

    a = 4'b1011;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("4'b1011 failed");
    #100;

    // 4 bits

    a = 4'b1111;
    #100;
    assert(y === 4'b1100) $display("Ok, y is 4'b1100"); else $error("4'b1111 failed");
    #100;

  end

endmodule
