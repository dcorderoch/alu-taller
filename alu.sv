module alu

#(parameter W = 4)
(
input logic [W-1:0] opcode,
input logic [W-1:0] a, // in 1
input logic [W-1:0] b, // in 2

input logic carry_in,

output logic [W-1:0] _output,

output logic carry_out,
output logic overflow,
output logic negative,
output logic zero
);

  logic [W-1:0] lls_out;
  logical_left_shifter #(W) _lls(a, b, lls_out);

  logic [W-1:0] lrs_out;
  logical_right_shifter #(W) _lrs(a, b, lrs_out);

  logic [W-1:0] als_out;
  arithmetic_left_shifter #(W) _als(a, b, als_out);

  logic [W-1:0] ars_out;
  arithmetic_right_shifter #(W) _ars(a, b, ars_out);

  logic [W-1:0] not_out;
  not_gate #(W) _ng(a, not_out);

  logic [W-1:0] and_out;
  and_gate #(W) _ag(a, b, and_out);

  logic [W-1:0] or_out;
  or_gate #(W) _og(a, b, or_out);

  logic [W-1:0] xor_out;
  xor_gate #(W) _xg(a, b, xor_out);

  logic _add_carry_out;

  logic [W-1:0] add_out;
  adder #(W) _adder(a, b, carry_in, add_out, _add_carry_out);

  logic _sub_carry_out;
  logic [W-1:0] sub_out;
  sub #(W) _sub(a, b, carry_in, sub_out, _sub_carry_out);

  logic [W-1:0] out;
  selector_mux #(W) _mux(opcode,
    lls_out,
    lrs_out,
    als_out,
    ars_out,
    not_out,
    and_out,
    or_out,
    xor_out,
    add_out,
    sub_out,
    out
  );

  flag_calculator #(W) _flag_calc(opcode,
    out,
    negative,
    overflow,
    zero,
    _add_carry_out,
    _sub_carry_out,
    carry_out
  );

  assign _output = out;

endmodule
