module not_gate

#(parameter W=3)
(
  input logic [W-1:0] a,
  output logic [W-1:0] out
);

assign result = ~a;

endmodule
