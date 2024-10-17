module HW4A(out, in, clk, rst);     // 10-stage lattice filter
    input[5:0] in;
    input clk, rst;
    output[19:0] out;
    wire[19:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,
               w22,w23,w24,w25,w26,w27,w28;
    wire[19:0] a1,a2 ;

    assign a1 = in;
    lattice_filter F0(a2, w0, a1, w1);
    lattice_filter F1(w2, w3, w0, w4);
    lattice_filter F2(w5, w6, w3, w7);
    lattice_filter F3(w8, w9, w6, w10);
    lattice_filter F4(w11, w12, w9, w13);
    lattice_filter F5(w14, w15, w12, w16);
    lattice_filter F6(w17, w18, w15, w19);
    lattice_filter F7(w20, w21, w18, w22);
    lattice_filter F8(w23, w24, w21, w25);
    lattice_filter F9(w26, w27, w24, w28);

    DFF D0(w28, w27, clk, rst);
    DFF D1(w25, w26, clk, rst);
    DFF D2(w22, w23, clk, rst);
    DFF D3(w19, w20, clk, rst);
    DFF D4(w16, w17, clk, rst);
    DFF D5(w13, w14, clk, rst);
    DFF D6(w10, w11, clk, rst);
    DFF D7(w7, w8, clk, rst);
    DFF D8(w4, w5, clk, rst);
    DFF D9(w1, w2, clk, rst);

    assign out = a2;

endmodule

module lattice_filter(out, tmp_out, in, tmp_in);   //one-stage
    input [19:0] in, tmp_in;
    output [19:0] out, tmp_out;
    parameter h = 1;

    assign tmp_out = tmp_in * h + in;
    assign out = tmp_out * h + tmp_in;

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