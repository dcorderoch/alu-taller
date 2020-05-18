module alu

#(parameter W = 4)
(
input logic [W-1:0] opcode, // op selector
input logic [W-1:0] a, // in 1
input logic [W-1:0] b, // in 2

input logic c_in, // carry in

output logic [W-1:0] y, // out

output logic c_out, // carry out
output logic v, // overfloW
output logic n, // negative
output logic z  // zero
);

  logic [W-1:0] lls_out;
  logical_left_shifter #(W) _logical_left_shifter(a, b, lls_out);

  logic [W-1:0] lrs_out;
  logical_right_shifter #(W) _logical_right_shifter(a, b, lrs_out);

  logic [W-1:0] als_out;
  arithmetic_left_shifter #(W) _arithmetic_left_shifter(a, b, als_out);

  logic [W-1:0] ars_out;
  arithmetic_right_shifter #(W) _arithmetic_right_shifter(a, b, ars_out);

  logic [W-1:0] not_out;
  not_gate #(W) _not_gate(a, not_out);

  logic [W-1:0] and_out;
  and_gate #(W) _and_gate(a, b, and_out);

  logic [W-1:0] or_out;
  or_gate #(W) _or_gate(a, b, or_out);

  logic [W-1:0] xor_out;
  xor_gate #(W) _xor_gate(a, b, xor_out);

  logic [W-1:0] adder_out;
  adder #(W) _adder(a, b, cin, adder_out, c_out);

  logic [W-1:0] sub_out;
  sub #(W) _subtractor(a, b, cin, sub_out, c_out);

  import alu_ops::*;

  logic [W-1:0] out;

  always_comb begin
  case (opcode)
    alu_ops::LL_SHIFT_OP: out = lls_out;
    alu_ops::LR_SHIFT_OP: out = lrs_out;
    alu_ops::AL_SHIFT_OP: out = als_out;
    alu_ops::AR_SHIFT_OP: out = ars_out;
    alu_ops::NOT_OP: out = not_out;
    alu_ops::AND_OP: out = and_out;
    alu_ops::OR_OP: out = or_out;
    alu_ops::XOR_OP: out = xor_out;
    alu_ops::ADD_OP: out = adder_out;
    alu_ops::SUB_OP: out = sub_out;
    default: out = lls_out;
  endcase
  end

  logic carry_out;
  logic negative;
  logic overflow;
  logic zero;

  always_comb begin
  case (opcode)
    alu_ops::ADD_OP, alu_ops::SUB_OP:
      begin
        carry_out = 'b0; // change
        negative = out[W-1];
        overflow = 'b0; // change
        case (out)
          'b0: z = 'b1;
          default: zero = 'b0;
        endcase
      end
    default:
      begin
        carry_out = 'b0;
        overflow = 'b0;
        negative = 'b0;
        zero = 'b0;
      end
  endcase
  end

  assign y = out;

  assign c_out = carry_out;
  assign n = negative;
  assign v = overflow;
  assign z = zero;

endmodule
