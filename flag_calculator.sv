module flag_calculator

#(parameter W = 4)
(
  input logic [W-1:0] opcode,
  input logic [W-1:0] op_result,
  output logic negative,
  output logic overflow,
  output logic zero,
  input logic add_cout,
  input logic sub_cout,
  output logic cout
);

  logic _cout;
  logic _negative;
  logic _overflow;
  logic _zero;

  import alu_ops::*;

  always_comb begin
    _negative = op_result[W-1];

    case (op_result)
      'b0: _zero = 'b1;
      default: _zero = 'b0;
    endcase

  case (opcode)
    alu_ops::ADD_OP:
      begin
        _cout = add_cout;
        _overflow = 'b0; // change for calculation
      end
    alu_ops::SUB_OP:
      begin
        _cout = sub_cout;
        _overflow = 'b0; // change for calculation
      end
  endcase
  end

  assign cout = _cout;
  assign negative = _negative;
  assign overflow = _overflow;
  assign zero = _zero;

endmodule
