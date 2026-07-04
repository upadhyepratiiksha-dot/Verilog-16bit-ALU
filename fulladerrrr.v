module FULLADDER(SUM, CARRY, A, B, CIN);
input A, B, CIN;
output SUM, CARRY;
wire T1, T2, T3;

xor G1(T1,A,B);
xor G2(SUM,T1,CIN);
and G3(T2,A,B);
and G4(T3,T1,CIN);
or G5(CARRY,T3,T2);

endmodule