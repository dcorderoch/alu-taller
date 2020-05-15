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

// gotta change that y there
logical_left_shifter #(w) _logical_left_shifter(a, b, y);

endmodule
