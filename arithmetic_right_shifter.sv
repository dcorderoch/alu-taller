module arithmetic_right_shifter

#(parameter W = 4)
(
  input logic signed [W-1:0] in,
  input logic [W-1:0] shift,
  output logic signed [W-1:0] out
);

logic signed [W-1:0] r;

always_comb begin
  r = in >>> shift;
end

assign out = r;

endmodule
