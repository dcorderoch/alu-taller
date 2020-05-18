module not_gate

#(parameter W = 4)
(
  input logic [W-1:0] a,
  output logic [W-1:0] out
);

  logic [W-1:0] r;

  always_comb begin
    r = ~a;
  end
  assign out = r;

endmodule
