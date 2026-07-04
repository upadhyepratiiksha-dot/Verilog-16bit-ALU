module ALU_COMPARATOR_16BIT(AeqB, AltB, AgtB, A, B);
input [15:0]A,B;
output AeqB, AltB, AgtB;
wire EQ0, EQ1, EQ3;
wire LT0, LT1, LT2;
wire GT0, GT1, GT2;

 mag_comparator C0(EQ0,LT0,GT0,A[3:0],B[3:0]);
 mag_comparator C1(EQ1,LT1,GT1,A[7:4],B[7:4]);
 mag_comparator C2(EQ2,LT2,GT2,A[11:8],B[11:8]);
 mag_comparator C3(EQ3,LT3,GT3,A[15:12],B[15:12]);
 
assign AgtB = GT3|(EQ3&GT2)|(EQ3&EQ2&GT1)|(EQ3&EQ2&EQ1&GT0);
assign AltB = LT3|(EQ3&LT2)|(EQ3&EQ2&LT1)|(EQ3&EQ2&EQ1&LT0);
assign AeqB = EQ3&EQ2&EQ1&EQ0;

endmodule

