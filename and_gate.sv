module and_gate

#(parameter W=3)
(
  input logic [W-1:0] a,
  input logic [W-1:0] b,
  output logic [W-1:0] out
);

logic [W-1:0] r;

always_comb begin
	r = a & b;
end

assign out = r;

endmodule
