module ALU_LOGIC(OUT,A,B,SEL);
input [15:0]A,B;
input [1:0]SEL;
output reg[15:0]OUT;

wire [15:0]AND_OUT;
wire [15:0]OR_OUT;
wire [15:0]XOR_OUT;
wire [15:0]NOT_OUT;

assign AND_OUT = A&B;
assign OR_OUT = A|B;
assign XOR_OUT = A^B;
assign NOT_OUT = ~A;

always @(*)
begin
case(SEL)
2'b00: OUT = AND_OUT;
2'b01: OUT = OR_OUT;
2'b10: OUT = XOR_OUT;
2'b11: OUT = NOT_OUT;
endcase
end
endmodule


