package ops;

  typedef enum logic [3:0] {  // 3-bit opcodes
    LL_SHIFT_OP = 4'b0000,
    LR_SHIFT_OP = 4'b0001,
    AR_SHIFT_OP = 4'b0010,
    NOT_OP = 4'b0011,
    AND_OP = 4'b0100,
    OR_OP = 4'b0101,
    XOR_OP = 4'b0110
  } opcode_e;

endpackage

