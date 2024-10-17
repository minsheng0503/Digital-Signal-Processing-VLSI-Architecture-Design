module HW4C(out, in, clk, rst);
    input[5:0] in;
    input clk, rst;
    output[19:0] out;
    wire[19:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18;
    wire[19:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19;
    wire[19:0] b1, b2;

    assign b1 = in;
    lattice_filter F0(b2, w0, b1, q19);
    DFF D0(q0, w0, clk, rst);

    lattice_filter F1(w18, w1, q0, q18);
    DFF D1(q1, w1, clk, rst);

    lattice_filter F2(w17, w2, q1, q17);
    DFF D2(q2, w2, clk, rst);

    lattice_filter F3(w16, w3, q2, q16);
    DFF D3(q3, w3, clk, rst);

    lattice_filter F4(w15, w4, q3, q15);
    DFF D4(q4, w4, clk, rst);

    lattice_filter F5(w14, w5, q4, q14);
    DFF D5(q5, w5, clk, rst);

    lattice_filter F6(w13, w6, q5, q13);
    DFF D6(q6, w6, clk, rst);

    lattice_filter F7(w12, w7, q6, q12);
    DFF D7(q7, w7, clk, rst);

    lattice_filter F8(w11, w8, q7, q11);
    DFF D8(q8, w8, clk, rst);

    lattice_filter F9(w10, w9, q8, q10);
    DFF D9(q9, w9, clk, rst);

    DFF D10(q10, q9, clk, rst);

    DFF D11(q11, w10, clk, rst);
    DFF D12(q12, w11, clk, rst);
    DFF D13(q13, w12, clk, rst);
    DFF D14(q14, w13, clk, rst);
    DFF D15(q15, w14, clk, rst);
    DFF D16(q16, w15, clk, rst);
    DFF D17(q17, w16, clk, rst);
    DFF D18(q18, w17, clk, rst);
    DFF D19(q19, w18, clk, rst);

    assign out = b2;


endmodule

module lattice_filter (out, tmp_out, in, tmp_in);
	input [19:0] in , tmp_in;
	output [19:0] tmp_out , out;
	parameter h = 1;
	
	assign tmp_out = tmp_in*h+in;
	assign out = tmp_out*h+tmp_in;
	
endmodule

module DFF(q,d,clk,rst);
    input [19:0] d;
    input clk, rst;
    output reg [19:0] q;

    always@(posedge clk)begin
        if(rst)begin
            q <= 0;
        end
        else begin 
            q <= d;
        end
    end
endmodule