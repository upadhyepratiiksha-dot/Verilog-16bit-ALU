module ALU_ADDER_16BIT(SUM,CARRY,SIGN,ZERO,PARITY,OVERFLOW,A,B,CIN);
input [15:0]A,B;
input CIN;
output [15:0]SUM;
output CARRY;
output SIGN;
output ZERO;
output PARITY;
output OVERFLOW;
wire [2:0]C;

ADDER_4BIT_RIPPLE A1(SUM[3:0],C[0],A[3:0],B[3:0],CIN);
ADDER_4BIT_RIPPLE A2(SUM[7:4],C[1],A[7:4],B[7:4],C[0]);
ADDER_4BIT_RIPPLE A3(SUM[11:8],C[2],A[11:8],B[11:8],C[1]);
ADDER_4BIT_RIPPLE A4(SUM[15:12],CARRY,A[15:12],B[15:12],C[2]);

assign SIGN = SUM[15];
assign ZERO = ~|SUM;
assign PARITY = ~^SUM;
assign OVERFLOW= A[15]&B[15]&~SUM[15]|~A[15]&~B[15]&SUM[15];
endmodule



