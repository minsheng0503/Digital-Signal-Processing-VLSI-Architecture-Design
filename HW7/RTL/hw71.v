module top(x1,x2,x3,x4,y1,y2,y3,y4);

input signed[4:0] x1, x2, x3, x4;
output signed[4:0] y1, y2, y3, y4;

wire signed[4:0] m11,m21,m31,m41,m22,m32,m42,m33,m43,m44;
wire signed[4:0] x12,x22,x32,x42,x23,x33,x43,x34,x44,x45;

assign m11 = 5'b10000;
assign m22 = 5'b10000;
assign m33 = 5'b10000;
assign m44 = 5'b10000;

sort s11(x1, m11, m21, x12);
sort s12(x2, m21, m31, x22);
sort s13(x3, m31, m41, x32);
sort s14(x4, m41,  y1, x42);

sort s22(x22, m22, m32, x23);
sort s23(x32, m32, m42, x33);
sort s24(x42, m42,  y2, x43);

sort s33(x33, m33, m43, x34);
sort s34(x43, m43,  y3, x44);

sort s44(x44, m44,  y4, x45);

endmodule

module sort(in1, in2, max, min);

input signed[4:0] in1, in2;
output signed[4:0] max, min;

assign max = (in1>=in2)?in1:in2;
assign min = (in1>=in2)?in2:in1;

endmodule