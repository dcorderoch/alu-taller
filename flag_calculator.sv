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
  logic _overflow;

  import alu_ops::*;

  always_comb begin
    case (opcode)
      alu_ops::ADD_OP:
        begin
          _cout = add_cout;
          _overflow = 'b0; // change for calculation
        end
      default:
      alu_ops::SUB_OP:
        begin
          _cout = sub_cout;
          _overflow = 'b0; // change for calculation
        end
      default:
        begin
          _cout = 'b0;
          _overflow = 'b0;
        end
    endcase
  end

  assign cout = _cout;
  assign negative = op_result[W-1];
  assign overflow = _overflow;
  assign zero = ( op_result === 'b0 );

endmodule
