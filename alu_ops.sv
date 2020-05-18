package alu_ops;

  typedef enum logic [3:0] {  // 3-bit opcodes
    LL_SHIFT_OP = 4'b0000,
    LR_SHIFT_OP = 4'b0001,
    AL_SHIFT_OP = 4'b0010,
    AR_SHIFT_OP = 4'b0011,
    NOT_OP = 4'b0100,
    AND_OP = 4'b0101,
    OR_OP = 4'b0110,
    XOR_OP = 4'b0111,
    ADD_OP = 4'b1000,
    SUB_OP = 4'b1001
  } opcode_e;

endpackage

