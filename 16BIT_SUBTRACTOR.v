module ALU_SUBTRACTOR_16BIT(
    DIFF,
    CARRY,
    BORROW,
    SIGN,
    ZERO,
    PARITY,
    OVERFLOW,
    A,
    B
);

input [15:0] A, B;

output [15:0] DIFF;
output CARRY;
output BORROW;
output SIGN;
output ZERO;
output PARITY;
output OVERFLOW;

ALU_ADDER_16BIT SUB(
    .SUM(DIFF),
    .CARRY(CARRY),
    .SIGN(SIGN),
    .ZERO(ZERO),
    .PARITY(PARITY),
    .OVERFLOW(OVERFLOW),
    .A(A),
    .B(~B),
    .CIN(1'b1)
);

assign BORROW = ~CARRY;

endmodule