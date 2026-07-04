module ADDER_4BIT_RIPPLE(SUM,CARRY,A,B,CIN);
input [3:0]A,B;
input CIN;
output [3:0]SUM;
output CARRY;
wire C1,C2,C3;

FULLADDER FA1(SUM[0],C1,A[0],B[0],CIN);
FULLADDER FA2(SUM[1],C2,A[1],B[1],C1);
FULLADDER FA3(SUM[2],C3,A[2],B[2],C2);
FULLADDER FA4(SUM[3],CARRY,A[3],B[3],C3);

endmodule
