module right_logic_shifter
#(parameter w=3)
(
  input [w-1:0] in,
  input clk,
  output reg [w-1:0] out
);

shifter #(w) _shifter(in, clk, 1, out);

endmodule

