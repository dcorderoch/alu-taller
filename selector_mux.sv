module selector_mux

#(parameter W = 4)
(
  input logic [W-1:0] opcode,
  input logic [W-1:0] logical_left_shift_result,
  input logic [W-1:0] logical_right_shift_result,
  input logic [W-1:0] arithmetic_left_shift_result,
  input logic [W-1:0] arithmetic_right_shift_result,
  input logic [W-1:0] not_result,
  input logic [W-1:0] and_result,
  input logic [W-1:0] or_result,
  input logic [W-1:0] xor_result,
  input logic [W-1:0] add_result,
  input logic [W-1:0] sub_result,
  output logic [W-1:0] out
);

  import alu_ops::*;

  always_comb begin
  case (opcode)
    alu_ops::LL_SHIFT_OP: out = logical_left_shift_result;
    alu_ops::LR_SHIFT_OP: out = logical_right_shift_result;
    alu_ops::AL_SHIFT_OP: out = arithmetic_left_shift_result;
    alu_ops::AR_SHIFT_OP: out = arithmetic_right_shift_result;
    alu_ops::NOT_OP: out = not_result;
    alu_ops::AND_OP: out = and_result;
    alu_ops::OR_OP: out = or_result;
    alu_ops::XOR_OP: out = xor_result;
    alu_ops::ADD_OP: out = add_result;
    alu_ops::SUB_OP: out = sub_result;
    default: out = logical_left_shift_result;
  endcase
  end

endmodule
