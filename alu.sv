module alu
#(parameter w=3)
(
input logic [w-1:0] opcode, // op selector
input logic [w-1:0] a, // in 1
input logic [w-1:0] b, // in 2

input logic c_in, // carry in

output logic [w-1:0] y, // out

output logic c_out, // carry out
output logic v, // overflow
output logic n, // negative
output logic z  // zero
);

  logic [w-1:0] out;
  logic [w-1:0] lls_out;
  logical_left_shifter #(w) _logical_left_shifter(a, b, lls_out);

  logic [w-1:0] lrs_out;
  logical_right_shifter #(w) _logical_right_shifter(a, b, lrs_out);

  logic [w-1:0] ars_out;
  arithmetic_right_shifter #(w) _arithmetic_right_shifter(a, b, ars_out);

  logic [w-1:0] not_out;
  not_gate #(w) _not_gate(a, not_out);

  logic [w-1:0] and_out;
  and_gate #(w) _and_gate(a, b, and_out);

  logic [w-1:0] or_out;
  or_gate #(w) _or_gate(a, b, or_out);

  logic [w-1:0] xor_out;
  xor_gate #(w) _xor_gate(a, b, xor_out);

  always_comb begin
  case (opcode)
    'b0000: out = lls_out;
    'b0001: out = lrs_out;
    'b0010: out = ars_out;
    'b0011: out = not_out;
    'b0100: out = and_out;
    'b0101: out = or_out;
    'b0110: out = xor_out;
    default: out = lls_out;
  endcase
  end

  assign y = out;

endmodule
