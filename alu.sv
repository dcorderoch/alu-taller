module alu
#(parameter w=3)
(
input [w-1:0] opcode, // op selector
input [w-1:0] a, // in 1
input [w-1:0] b, // in 2

input [w-1:0] c_in, // carry in

output [w-1:0] y, // out

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

  always_comb begin
  case opcode:
    'b0000: out = lls_out;
    'b0001: out = lrs_out;
  endcase
  end

endmodule
