module adder

#(parameter W = 4)
(
  input logic [W-1:0] a,
  input logic [W-1:0] b,
  input logic cin,
  output logic [W-1:0] s,
  output logic cout
);

  assign {cout, s} = a + b + cin;

endmodule
