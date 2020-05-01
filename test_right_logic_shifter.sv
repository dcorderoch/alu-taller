module test_right_logic_shifter();

  logic [3:0] a;
  logic [3:0] y;

  logic clk;
	 
  right_logic_shifter #(4) DUT(a, clk, y);
	 
  initial begin
    a = 4'b0000;  clk = 1; #100;
	 assert(y === 4'b0000) $display("Ok, y is 4'b0010"); else $error("4'b0000 failed");
	 clk = 0; #100;
    a = 4'b0001;  clk = 1; #100;
	 assert(y === 4'b0000) $display("Ok, y is 4'b0010"); else $error("4'b0001 failed");
	 clk = 0; #100;
	 a = 4'b0010; clk = 1; #100;
    assert(y === 4'b0001) $display("Ok, y is 4'b0100"); else $error("4'b0010 failed");
	 clk = 0; #100;
	 a = 4'b0100; clk = 1; #100;
    assert(y === 4'b0010) $display("Ok, y is 4'b1000"); else $error("4'b0100 failed");
	 clk = 0; #100;
	 a = 4'b1000; clk = 1; #100;
    assert(y === 4'b0100) $display("Ok, y is 4'b0000"); else $error("4'b1000 failed");
  end

endmodule
