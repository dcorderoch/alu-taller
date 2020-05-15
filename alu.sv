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

  always_comb begin
  case (opcode)
    'b0000: out = lls_out;
    'b0001: out = lrs_out;
    'b0010: out = ars_out;
    default: out = lls_out;
  endcase
  end

  assign y = out;

endmodule
