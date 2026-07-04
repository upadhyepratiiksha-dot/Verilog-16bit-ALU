module ALU_16BIT(
    RESULT,
    CARRY,
    BORROW,
    SIGN,
    ZERO,
    PARITY,
    OVERFLOW,
    AgtB,
    AltB,
    AeqB,
    A,
    B,
    OPCODE,
    LOGIC_SEL
);

input [15:0] A,B;
input [2:0] OPCODE;
input [1:0] LOGIC_SEL;

output reg [15:0] RESULT;
output reg CARRY;
output reg BORROW;
output reg SIGN;
output reg ZERO;
output reg PARITY;
output reg OVERFLOW;

output reg AgtB;
output reg AltB;
output reg AeqB;

wire [15:0] ADD_OUT;
wire [15:0] SUB_OUT;
wire [15:0] INC_OUT;
wire [15:0] DEC_OUT;
wire [15:0] LOGIC_OUT;

wire ADD_CARRY,ADD_SIGN,ADD_ZERO,ADD_PARITY,ADD_OVERFLOW;
wire SUB_CARRY,SUB_BORROW,SUB_SIGN,SUB_ZERO,SUB_PARITY,SUB_OVERFLOW;
wire INC_CARRY,INC_SIGN,INC_ZERO,INC_PARITY,INC_OVERFLOW;
wire DEC_CARRY,DEC_SIGN,DEC_ZERO,DEC_PARITY,DEC_OVERFLOW;

wire CMP_GT,CMP_LT,CMP_EQ;

ALU_ADDER_16BIT ADD(
.SUM(ADD_OUT),
.CARRY(ADD_CARRY),
.SIGN(ADD_SIGN),
.ZERO(ADD_ZERO),
.PARITY(ADD_PARITY),
.OVERFLOW(ADD_OVERFLOW),
.A(A),
.B(B),
.CIN(1'b0)
);

ALU_SUBTRACTOR_16BIT SUB(
.DIFF(SUB_OUT),
.CARRY(SUB_CARRY),
.BORROW(SUB_BORROW),
.SIGN(SUB_SIGN),
.ZERO(SUB_ZERO),
.PARITY(SUB_PARITY),
.OVERFLOW(SUB_OVERFLOW),
.A(A),
.B(B)
);

ALU_INCREMENTER INC(
.INC(INC_OUT),
.CARRY(INC_CARRY),
.SIGN(INC_SIGN),
.ZERO(INC_ZERO),
.PARITY(INC_PARITY),
.OVERFLOW(INC_OVERFLOW),
.A(A)
);

ALU_DECREMENTER DEC(
.DEC(DEC_OUT),
.CARRY(DEC_CARRY),
.SIGN(DEC_SIGN),
.ZERO(DEC_ZERO),
.PARITY(DEC_PARITY),
.OVERFLOW(DEC_OVERFLOW),
.A(A)
);

ALU_LOGIC LOGIC(
.OUT(LOGIC_OUT),
.A(A),
.B(B),
.SEL(LOGIC_SEL)
);

ALU_COMPARATOR_16BIT CMP(
.AeqB(CMP_EQ),
.AltB(CMP_LT),
.AgtB(CMP_GT),
.A(A),
.B(B)
);

always @(*)
begin

    RESULT = 16'h0000;
    CARRY = 0;
    BORROW = 0;
    SIGN = 0;
    ZERO = 0;
    PARITY = 0;
    OVERFLOW = 0;
    AgtB = 0;
    AltB = 0;
    AeqB = 0;

    case(OPCODE)

    3'b000:
    begin
        RESULT = ADD_OUT;
        CARRY = ADD_CARRY;
        SIGN = ADD_SIGN;
        ZERO = ADD_ZERO;
        PARITY = ADD_PARITY;
        OVERFLOW = ADD_OVERFLOW;
    end

    3'b001:
    begin
        RESULT = SUB_OUT;
        CARRY = SUB_CARRY;
        BORROW = SUB_BORROW;
        SIGN = SUB_SIGN;
        ZERO = SUB_ZERO;
        PARITY = SUB_PARITY;
        OVERFLOW = SUB_OVERFLOW;
    end

    3'b010:
    begin
        RESULT = LOGIC_OUT;
    end

    3'b011:
    begin
        RESULT = INC_OUT;
        CARRY = INC_CARRY;
        SIGN = INC_SIGN;
        ZERO = INC_ZERO;
        PARITY = INC_PARITY;
        OVERFLOW = INC_OVERFLOW;
    end

    3'b100:
    begin
        RESULT = DEC_OUT;
        CARRY = DEC_CARRY;
        SIGN = DEC_SIGN;
        ZERO = DEC_ZERO;
        PARITY = DEC_PARITY;
        OVERFLOW = DEC_OVERFLOW;
    end

    3'b101:
    begin
        AgtB = CMP_GT;
        AltB = CMP_LT;
        AeqB = CMP_EQ;
    end

    endcase

end

endmodule