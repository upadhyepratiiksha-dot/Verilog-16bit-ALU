//4-bit magnitude comparator using full adders
module mag_comparator( AeqB, AltB, AgtB,A, B);
input [3:0]A,B;
output AeqB, AltB, AgtB;
wire SUM0,SUM1,SUM2,SUM3;
wire CARRY0,CARRY1,CARRY2,CARRY3;
wire t1,t2,t3;

FULLADDER FA1 (SUM0,CARRY0,A[0],~B[0],1'b1);
FULLADDER FA2 (SUM1,CARRY1,A[1],~B[1],CARRY0);
FULLADDER FA3 (SUM2,CARRY2,A[2],~B[2],CARRY1);
FULLADDER FA4 (SUM3,CARRY3,A[3],~B[3],CARRY2);

or G1(t1,SUM3,SUM2);
or G2(t2,SUM1,SUM0);
nor G3(t3,t1,t2);
and G4(AgtB,CARRY3,~t3);
and G5(AltB,~CARRY3,~t3);
and G6(AeqB,CARRY3,t3);

endmodule











