module flag_calculator

#(parameter W = 4)
(
  input logic [W-1:0] opcode,
  input logic [W-1:0] op_result,
  output logic negative,
  output logic overflow,
  output logic zero
);

  logic _negative;
  logic _overflow;
  logic _zero;

  import alu_ops::*;

  always_comb begin
  case (opcode)
    alu_ops::ADD_OP, alu_ops::SUB_OP:
      begin
        _negative = op_result[W-1];
        _overflow = 'b0; // change
        case (op_result)
          'b0: _zero = 'b1;
          default: _zero = 'b0;
        endcase
      end
    default:
      begin
        _overflow = 'b0;
        _negative = 'b0;
        _zero = 'b0;
      end
  endcase
  end

  assign negative = _negative;
  assign overflow = _overflow;
  assign zero = _zero;

endmodule
